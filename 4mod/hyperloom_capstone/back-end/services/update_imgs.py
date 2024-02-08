from .world_generator import update_all_images
import os
from PIL import Image
from io import BytesIO
from worlds.models import World
import base64
import time
import re
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from .api_services import imagine
from .world_generator import wait_for_image
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By

def is_png_image_displayed(driver):
    try:
        # Find all images on the page
        images = driver.find_elements(By.TAG_NAME, "img")
        # If there's only one image and its src ends with '.png', return True
        return len(images) == 1 and images[0].get_attribute('src').endswith('.png')
    except Exception as e:
        print(f"Error checking if PNG image is displayed: {e}")
        return False

def find_coordinates():
    chrome_options = Options()
    chrome_options.binary_location = os.environ.get("GOOGLE_CHROME_BIN")
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("window-size=1920x1080")  # Explicitly set window size

    driver = webdriver.Chrome(options=chrome_options)
    
    worlds = World.objects.all()
    filtered_worlds = [world for world in worlds if world.is_complete]

    x_guesses = range(0, 21, 1) 
    y_guesses = range(200, 301, 5)

    xy_guesses = [(x, y) for x in x_guesses for y in y_guesses]


    for idx, world in enumerate(filtered_worlds):
        print(f"trying world {world.id}")
        thumbnail_url = world.imgs.get("thumbnails")
        if thumbnail_url:
            thumbnail_url = thumbnail_url[0]

        pattern = re.compile(r"\.png$") 
        if pattern.search(thumbnail_url):
            expected_url = thumbnail_url
            driver.get(thumbnail_url)

            time.sleep(5)

            if not is_png_image_displayed(driver):
                x, y = xy_guesses[idx % len(xy_guesses)]

                try:
                    action = ActionChains(driver)
                    action.move_by_offset(-9999, -9999)  
                    action.perform()
                    action.move_by_offset(x, y).click().perform()
                    time.sleep(5)  

                    if is_png_image_displayed(driver):
                        print(f"Found valid coordinates: X={x}, Y={y} for world {world.id}")
                        break
                except Exception as e:
                    print(f"Error while trying coordinates X={x}, Y={y} for world {world.id}. Error: {e}")

    driver.quit()



def compress_thumbnail(world):
    # Setup Chrome options
    chrome_options = Options()
    chrome_options.binary_location = os.environ.get("GOOGLE_CHROME_BIN")
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--no-sandbox")
    
    # Instantiate the driver inside the function
    driver = webdriver.Chrome(options=chrome_options)

    try:
        print(f"---\nStarting world {world.id}")
        pattern = re.compile(r"\.png$") 
        thumbnail_url = world.imgs.get("thumbnails")
        if thumbnail_url and pattern.search(thumbnail_url):
            thumbnail_url = thumbnail_url[0]
        
        if not thumbnail_url:
            print(f"No thumbnail URL for world {world.id}")

        print(f"Thumbnail URL: {thumbnail_url}")
        
        if not pattern.search(thumbnail_url):
            print(f"URL doesn't match the pattern: {thumbnail_url}")
        
        # Navigate to the URL using Selenium
        driver.get(thumbnail_url)
        
        # Sleep to ensure page loads and any challenges are handled
        time.sleep(5)
        
        # Capture the screenshot as the image
        img_data = driver.get_screenshot_as_png()
        
        print(f"Successfully fetched image for world {world.id}")

        img = Image.open(BytesIO(img_data))
        img.thumbnail((200, 200))

        compressed_img_data = BytesIO()
        img.save(compressed_img_data, format='PNG', quality=95)
        base64_encoded = base64.b64encode(compressed_img_data.getvalue()).decode('utf-8')
        world.img["thumbnail"] = base64_encoded
      
        print(f"Compressed image for world {world.id}")
        
        world.save()
        print(f"Saved world {world.id}")

    except Exception as e:
        print(f"Error for world {world.id} while accessing URL {thumbnail_url}. Error: {e}")
    finally:
        driver.quit()  # Ensure the driver is closed after each usage.

def compress_thumbnails():
    worlds = World.objects.all()

    for world in worlds:
        compress_thumbnail(world)


def get_new_heros():
    worlds = World.objects.all()
    filtered_worlds = [world for world in worlds if not world.is_complete]

    for world in filtered_worlds:
      print(f'working on hero for world {world.id}...')

      heros = world.imgs.get("heros")
      
      thumbnail = world.imgs.get("thumbnails")
      if thumbnail:
          thumbnail = thumbnail[0]

      pattern = re.compile(r"\.png$") 

      if thumbnail and pattern.search(thumbnail) and not heros:

        hero = {}
        while not hero.get("success", False):
            hero = imagine(
            {"model": "world", "id": world.id, "type": "hero"},
            thumbnail + " " + ' '.join(world.genres) + " " + world.imagine + " --iw .75 --ar 3:2"
            )
            if hero.get("success") == False:
                time.sleep(3)

        hero = wait_for_image(hero)
        print(f"hero finished for world {world.id}")
      
      else: 
          print("world is missing thumbnail")

def revert_thumbnails():
    worlds = World.objects.all()
    for world in worlds:
        try:
            world.img["thumbnail"] = world.imgs["thumbnails"][0]
            world.save()
        except: 
            continue


# revert_thumbnails()

# find_coordinates()

# get_new_heros()

# compress_thumbnails()

# update_all_images()