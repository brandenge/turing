import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "worlds.settings") 

import django
django.setup()

from .attributes import categorize_world, CATEGORIES
from worlds.models import World

worlds = World.objects.all()
for world in worlds:
    categorize_world(world)
    world.save()