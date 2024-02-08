import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "worlds.settings")
django.setup()

import json
from .api_services import gpt_response, dalle_image, imagine, get_progress, upscale_img
from .prompts import gpt_prompt
from .attributes import random_attributes, categorize_world, CATEGORIES
from django.db.models import Q
from worlds.models import World, Event, Location, Character, Species
import time
import re


def generate_random_world():
    attributes = random_attributes()
    print(attributes)
    world_response = gpt_response(gpt_prompt(attributes))
    print(world_response)

    try:
        world_json = json.loads(world_response)

        related_fields = ['species', 'characters', 'events', 'locations']
        world_info = {k: v for k, v in world_json.items() if k not in related_fields}
        world = World.objects.create(**world_info)

        for species in world_json.get('species', []):
            Species.objects.create(world=world, **species)

        for char in world_json.get('characters', []):
            Character.objects.create(world=world, **char)

        for event in world_json.get('events', []):
            Event.objects.create(world=world, **event)

        for location in world_json.get('locations', []):
            Location.objects.create(world=world, **location)

        categorize_world(world)
        world.save()
        print("world object created: \n")
        print(world)
        add_midj_images(world)
        return world

    except json.JSONDecodeError as e:
        error = f"""
        Error decoding JSON: {e}
        Response text: {world_response}"
        """
        return error
    
def add_midj_images(world):
    print(f'working on landscapes for world {world.id}...')

    thumbnail, landscape = {}, {}
    while not thumbnail.get("success", False):
        thumbnail = imagine(
            {"model": "world", "id": world.id, "type": "thumbnail"},
            ' '.join(world.genres) + " landscape view of this world: " + world.imagine
        )
        if thumbnail.get("success") == False:
            time.sleep(3)

    thumbnail = wait_for_image(thumbnail)
    
    if not (thumbnail == "none" or thumbnail == "incomplete"):
        thumbnail = thumbnail["imageUrls"][0]
        while not landscape.get("success", False):
            landscape = imagine(
            {"model": "world", "id": world.id, "type": "landscape"},
            thumbnail + " " + ' '.join(world.genres) + " " + world.imagine + " --iw .75 --ar 9:3"
            )
            if landscape.get("success") == False:
                time.sleep(3)

        landscape = wait_for_image(landscape)
    else:
        return 'No thumbnail found'

    if not (landscape == "none" or landscape == "incomplete"):
        landscape = landscape["imageUrls"][0]

    locations = world.locations.all()
    for i, location in enumerate(locations):
        print(f'working on {i+1}/{len(locations)} locations for {world.name}, world {world.id}')
   
        response = {}
        while not response.get("success", False):
            response = imagine(
                {"model": "location", "id": location.id},
                thumbnail + " " + landscape + " " +
                ' '.join(world.genres) + " " + location.imagine + " --iw .42 --ar 3:4"
            )
            if response.get("success") == False:
                time.sleep(3)

        response = wait_for_image(response) 

    species_list = world.species.all()
    for i, speciez in enumerate(species_list):
        print(f'working on {i + 1}/{len(species_list)} species for {world.name}, world {world.id}')

        response = {}
        while not response.get("success", False):
            response = imagine(
                    {"model": "species", "id": speciez.id},
                    thumbnail + " " + landscape + " " +
                    ' '.join(world.genres) + " " + speciez.imagine + " --iw .55 --ar 3:4"
                )
            if response.get("success") == False:
                time.sleep(3)

        response = wait_for_image(response)

    chars = world.characters.all()

    for i, char in enumerate(chars):
        print(f'working on {i + 1}/{len(chars)} characters for {world.name}, world {world.id}')

        try:
            char_species = world.species.get(name=char.species)
        except Species.DoesNotExist:
                try:
                    char_species = world.species.get(name=char.species[:-1])
                except Species.DoesNotExist:
                    char_species = None

        if not char_species:
            char_species = world.species.order_by('?').first() 
        
        species_url = char_species.img if char_species else ''
        
        first_location = world.locations.order_by('?').first()
        location_url = first_location.img if first_location else ''

        response = {}
        while not response.get("success", False):
            response = imagine({"model": "character", "id": char.id}, 
                location_url + " " + species_url + " " +
                ' '.join(world.genres) + " " + char.imagine + " --iw .88 --ar 3:4")
            if response.get("success") == False:
                time.sleep(3) 
        
        response = wait_for_image(response)

    events = world.events.all()

    for i, event in enumerate(events):
        print(f'working on {i + 1}/{len(events)} incomplete events for {world.name}, world {world.id}')

        try:
            event_location = world.locations.get(name=event.location)
        except Location.DoesNotExist:
            event_location = None

        response = {}
        location_url = event_location.img if event_location else world.locations.order_by('?').first().img

        while not response.get("success", False):
            response = imagine({"model": "event", "id": event.id}, 
                location_url + " " + ' '.join(world.genres) + " " + event.imagine + " --iw .42 --ar 3:4")
            if response.get("success") == False:
                time.sleep(3)

        response = wait_for_image(response)

    print('ding! world finished. wow!')
    

def update_midj_images(world):
    print(f'working on landscapes for world {world.id}...')
    
    world_img = world.img
    world_imgs = world.imgs if isinstance(world.imgs, dict) else {}

    thumbnail = world_img.get("thumbnail")
    landscape = world_img.get("landscape")

    if thumbnail is not None and isinstance(thumbnail, str) and thumbnail.startswith("https"):
        pattern = re.compile(r"/0_\d\.png$")
        if "thumbnails" not in world_imgs or not pattern.search(world_imgs["thumbnails"][0]) and pattern.search(thumbnail):
            base_url = re.sub(r"/0_\d\.png$", "", thumbnail) 
            world_imgs["thumbnails"] = [f"{base_url}/0_{i}.png" for i in range(4)]

    elif thumbnail is not None and isinstance(thumbnail, str) and not thumbnail=="none":
        try: 
            thumbnail = upscale_img(thumbnail)
            if isinstance(thumbnail, str) and thumbnail.startswith('https'):
                world.img["thumbnail"] = thumbnail
                base_url = thumbnail[:-7]
                world_imgs["thumbnails"] = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
        except: 
            thumbnail = None

    elif thumbnail is None or not isinstance(thumbnail, str) or thumbnail == "none":
        thumbnail = {}
        while not thumbnail.get("success", False):
            thumbnail = imagine(
                {"model": "world", "id": world.id, "type": "thumbnail"},
                ' '.join(world.genres) + " landscape view of this world: " + world.imagine
            )
            if thumbnail.get("success") == False:
                time.sleep(3)

        thumbnail = wait_for_image(thumbnail)
        if not (thumbnail == "none" or thumbnail == "incomplete"):
            world_imgs["thumbnails"] = thumbnail["imageUrls"]
            world_img["thumbnail"] = thumbnail = thumbnail["imageUrls"][0]
        else:
            thumbnail = world_img["thumbnail"] = "none"
            world_imgs["thumbnails"] = []
    else: 
        thumbnail = world_img["thumbnail"] = "none"


    if landscape is not None and isinstance(landscape, str) and landscape.startswith("https"):
        pattern = re.compile(r"/0_\d\.png$")
        if "landscapes" not in world_imgs or not world_imgs["landscapes"][0] or not pattern.search(world_imgs["landscapes"][0]) and pattern.search(landscape):
            base_url = re.sub(r"/0_\d\.png$", "", landscape) 
            world_imgs["landscapes"] = [f"{base_url}/0_{i}.png" for i in range(4)]
    
    elif landscape is not None and isinstance(landscape, str) and not landscape=="none":
        try: 
            landscape = upscale_img(landscape)
            if isinstance(landscape, str) and landscape.startswith('https'):
                world_img["landscape"] = landscape
                base_url = landscape[:-7]
                world_imgs["landscapes"] = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
        except: 
            landscape = None

    elif landscape is None or landscape == "none" or not isinstance(landscape, str):
        landscape = {}
        while not landscape.get("success", False):
            landscape = imagine(
                {"model": "world", "id": world.id, "type": "landscape"},
                thumbnail + " " + ' '.join(world.genres) + " " + world.imagine + " --iw .75 --ar 9:3"
            )
            if landscape.get("success") == False:
                time.sleep(3)

        landscape = wait_for_image(landscape)
        if isinstance(landscape, dict):
            world_imgs["landscapes"] = landscape["imageUrls"]
            world_img["landscape"] = landscape = landscape["imageUrls"][0]
        else:
            world_img["landscape"], world_imgs["landscapes"] = "none", []
            
    else:
        landscape = world_img["landscape"] = "none"

    world.imgs = world_imgs
    world.save()
      
    locations = world.locations.all()
    locations_responses = []
    for i, location in enumerate(locations):
        print(f'working on {i+1}/{len(locations)} incomplete locations for {world.name}, world {world.id}')

        if isinstance(location.img, str) and isinstance(location.imgs, list) and location.imgs[0] and not location.imgs[0].endswith('.png'):
            pattern = re.compile(r"/0_\d\.png$")
            if not pattern.search(location.imgs[0]) and pattern.search(location.img):
                base_url = re.sub(r"/0_\d\.png$", "", location.img) 
                world_imgs["landscapes"] = [f"{base_url}/0_{i}.png" for i in range(4)]


        if isinstance(location.img, str) and not (location.img == "none" or location.img == ''):
            try:
                location.img = upscale_img(location.img)
                base_url = img[:-7]
                location.imgs["thumbnails"] = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
            except:
                location.img = "none"

        else:
            thumbnail = "none" if thumbnail is None else thumbnail
            landscape = "none" if landscape is None else landscape
            print (thumbnail + landscape)
            
            response = {}
            while not response.get("success", False):
                response = imagine(
                    {"model": "location", "id": location.id},
                    thumbnail + " " + landscape + " " +
                    ' '.join(world.genres) + " " + location.imagine + " --iw .42 --ar 3:4"
                )
                if response.get("success", False):
                    time.sleep(2)
            locations_responses.append(response)
    
    for i in range(len(locations_responses)):
        locations_responses[i] = wait_for_image(locations_responses[i])
            
    species_list = world.species.all()
    species_responses = []
    for i, speciez in enumerate(species_list):
        print(f'working on {i + 1}/{len(species_list)} species for {world.name}, world {world.id}')

        if isinstance(speciez.img, str) and speciez.img.endswith('.png'):
            pattern = re.compile(r"/0_\d\.png$")
            if not speciez.imgs or not pattern.search(speciez.imgs[0]) and pattern.search(speciez.img):
                base_url = re.sub(r"/0_\d\.png$", "", speciez.img) 
                speciez.imgs = [f"{base_url}/0_{i}.png" for i in range(4)]

        elif isinstance(speciez.img, str) and not (speciez.img == "none" or speciez.img == ''):
          try:
              speciez.img = upscale_img(speciez.img)
              base_url = img[:-7]
              speciez.imgs["thumbnails"] = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
          except:
              speciez.img = "none"
      
        else:
            thumbnail = '' if thumbnail is None else thumbnail
            landscape = '' if landscape is None else landscape
            print (thumbnail + landscape)
        
            response = {}
            while not response.get("success", False):
                response = imagine(
                      {"model": "species", "id": speciez.id},
                      thumbnail + " " + landscape + " " +
                      ' '.join(world.genres) + " " + speciez.imagine + " --iw .55 --ar 3:4"
                  )
                if response.get("success", False):
                    time.sleep(2)
            
            species_responses.append(response)

    for i in range(len(species_responses)):
        species_responses[i] = wait_for_image(species_responses[i])

    chars = world.characters.all()
    char_responses = []

    for i, char in enumerate(chars):
        print(f'working on {i + 1}/{len(chars)} characters for {world.name}, world {world.id}')

        
        if isinstance(char.img, str) and char.img.endswith('.png'):
            pattern = re.compile(r"/0_\d\.png$")
            if not char.imgs or not pattern.search(char.imgs[0]) and pattern.search(char.img):
                base_url = re.sub(r"/0_\d\.png$", "", char.img) 
                char.imgs = [f"{base_url}/0_{i}.png" for i in range(4)]
  
        
        if isinstance(char.img, str) and not (char.img == "none" or char.img == ''):
          try:
              img = char.img = upscale_img(char.img)
              base_url = img[:-7]
              char.imgs = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
          except:
              char.img = "none"
              char.imgs = []
        
        else:
            try:
                char_species = world.species.get(name=char.species)
            except Species.DoesNotExist:
                  try:
                      char_species = world.species.get(name=char.species[:-1])
                  except Species.DoesNotExist:
                      char_species = None

            if not char_species:
              char_species = world.species.order_by('?').first() 
            
            species_url = char_species.img if char_species else ''
            
            first_location = world.locations.order_by('?').first()
            location_url = first_location.img if first_location else ''

            response = {}
            while not response.get("success", False):
                response = imagine({"model": "character", "id": char.id}, 
                    location_url + " " + species_url + " " +
                    ' '.join(world.genres) + " " + char.imagine + " --iw .88 --ar 3:4")
                if response.get("success", False):
                  time.sleep(2) 

            char_responses.append(response)

            if i == len(chars) - 1:
                for response in char_responses:
                    wait_for_image(response)

    events = world.events.all()

    for i, event in enumerate(events):
        print(f'working on {i + 1}/{len(events)} incomplete events for {world.name}, world {world.id}')
        
        if isinstance(event.img, str) and event.img.endswith('.png'):
            pattern = re.compile(r"/0_\d\.png$")
            if not event.imgs or not pattern.search(event.imgs[0]) and pattern.search(event.img):
                base_url = re.sub(r"/0_\d\.png$", "", event.img) 
                event.imgs = [f"{base_url}/0_{i}.png" for i in range(4)]

        elif isinstance(event.img, str) and not (event.img == "none" or event.img == ''):
          try:
              img = event.img = upscale_img(event.img)
              base_url = img[:-7]
              event.imgs["thumbnails"] = [base_url + "0_0.png", base_url + "0_1.png", base_url + "0_2.png", base_url + "0_3.png"]
          except:
              event.img = "none"

        else:
            event_location = None

            try:
                event_location = world.locations.get(name=event.location)
            except Location.DoesNotExist:
                event_location = None

            response = {}
            location_url = event_location.img if event_location else world.locations.order_by('?').first().img

            while not response.get("success", False):
                response = imagine({"model": "event", "id": event.id}, 
                    location_url + " " + ' '.join(world.genres) + " " + event.imagine + " --iw .42 --ar 3:4")
                time.sleep(2)
            if i == len(events) - 1:
                wait_for_image(response)

    print('ding! world finished. wow!')



def wait_for_image(msg):
    if "messageId" in msg:
        try:
            update = get_progress(msg["messageId"])
        except:
            return 'none'

        if isinstance(update["progress"], str) and update["progress"] != 'incomplete':
            update["progress"] = int(update["progress"])
            
        while isinstance(update["progress"], int) and update["progress"] == 0:
            print("job started, brb...")
            time.sleep(42)
            update = get_progress(msg["messageId"])


        while not update["progress"] == 100:
            print(f'hol\' up, job cookin\'.. {update["progress"]}%')
            time.sleep(4)
            update = get_progress(msg["messageId"])

            if update["progress"] == "incomplete":
                print('woops! job hanging, moving on..')
                return 'incomplete'

        print("ding! job finished.")
        return update["response"]
    

def add_dalle_images(world):
        world["img"] = dalle_image(world["imagine"])
        for species in world["species"]:
            species["img"] = dalle_image(species["imagine"])
        for location in world["locations"]:
            location["img"] = dalle_image(location["imagine"])
        for char in world["characters"]:
            char["img"] = dalle_image(char["imagine"])
        for event in world["events"]:
            event["img"] = dalle_image(event["imagine"])
        
        return world


def update_all_images():
    worlds = World.objects.all()
    for i, world in enumerate(worlds):
        print(f'Working on {world.name}, world {world.id}, {i + 1} / {len(worlds)} worlds')
        add_midj_images(world)
    print("holy cow, that's all folks!!")


def generate_new_worlds(n=13):
    new_worlds = []
    for _ in range(n):
        try:
            new_world = generate_random_world()
            new_worlds.append(new_world)
        except Exception as e:
            print(f"Error generating new world: {e}")
    
    return new_worlds