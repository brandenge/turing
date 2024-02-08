import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "worlds.settings")
django.setup()

import random
from worlds.models import World

GENRE_MAPPING = {
    'Historical & Cultural': [
        '1950s Suburbia', 'American Pioneers', 'American Revolution', 'Americana', 
        'Ancient Egypt', 'Art Deco', 'Art Nouveau', 'Australian Outback', 'Baroque', 
        'Bauhaus', 'Classicism', 'Danish Pastel', 'Elizabethan England', 'Gothic', 
        'Impressionism', 'Italian Renaissance', 'Medieval', 'Neoclassicism', 
        'Neo-Romanism', 'Old Hollywood', 'Pre-Raphaelite', 'Romanticism', 'Victorian', 
        'World War II'
    ],
    'Nature & Environment': [
        'Autumn', 'Beach Day', 'Cabincore', 'Cottagecore', 'Desertwave', 'Earthcore', 
        'Forestpunk', 'Gardencore', 'Golden Hour', 'Grasscore', 'Highlandcore', 
        'Junglecore', 'Naturecore', 'Ocean Academia', 'Ocean Grunge', 'Rusticcore', 
        'Swampcore'
    ],
    'Urban & Modern': [
        'Abstract Tech', 'Atompunk', 'City Pop', 'Cyberprep', 'Decopunk', 'Diner', 
        'Miami Metro', 'Midwest Gothic', 'Minimalism', 'Nuclear', 'Suburban', 'Vintage'
    ],
    'Fantasy & Mystical': [
        'Alien', 'Dark Fantasy', 'Ethereal', 'Fairy Tale', 'Fantasy', 'Medieval Fantasy', 
        'Surrealism'
    ],
    'Futuristic & Tech': [
        'Afrofuturism', 'Clockpunk', 'Cyberdelic', 'Cyberpunk', 'Futurism', 'Gadgetpunk', 
        'Icepunk', 'Retro-Futurism', 'Silkpunk', 'Spacecore', 'Steampunk', 'Transhumanism', 
        'Underwater', 'Utopiacore', 'Wavepunk', 'Woodpunk'
    ],
    'Miscellaneous & Niche': [
        'Auroracore', 'Goblincore', 'Military', 'Monumentality', 'Mushroomcore', 'Nautical', 
        'New England Gothic', 'Paleocore', 'Pirate', 'Post-Apocalyptic', 'Prehistoricore', 
        'Sandalpunk', 'Seapunk', 'Stonecore'
    ]
}

def get_category_based_on_genre(genre):
    for category, genres_list in GENRE_MAPPING.items():
        if genre in genres_list:
            return category
    return None

def assign_category_to_world(world):
    category_counts = {}

    for genre in world.genres:
        category = get_category_based_on_genre(genre)
        if category:
            category_counts[category] = category_counts.get(category, 0) + 1

    if not category_counts: 
        return None

    sorted_categories = sorted(
        category_counts.keys(),
        key=lambda category: (
            category_counts[category], 
            -World.objects.filter(category=category).count()
        ),
        reverse=True
    )

    top_count = category_counts[sorted_categories[0]]
    tied_categories = [cat for cat, count in category_counts.items() if count == top_count]
    
    return random.choice(tied_categories)

def assign_categories_to_worlds():
    worlds = World.objects.all()

    for world in worlds:
        category = assign_category_to_world(world)
        if category:  # Add this check
            world.category = category
            world.save()

assign_categories_to_worlds()