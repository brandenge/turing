from django.contrib import admin
from .models import World
from locations.models import Location
from characters.models import Character
from events.models import Event
from species.models import Species

admin.site.register(World)
admin.site.register(Location)
admin.site.register(Character)
admin.site.register(Event)
admin.site.register(Species)