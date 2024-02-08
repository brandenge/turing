from rest_framework import serializers
from .models import World
from locations.serializers import LocationSerializer
from characters.serializers import CharacterSerializer
from events.serializers import EventSerializer
from species.serializers import SpeciesSerializer

class WorldSerializer(serializers.ModelSerializer):

    locations = LocationSerializer(many=True, read_only=True)
    characters = CharacterSerializer(many=True, read_only=True)
    events = EventSerializer(many=True, read_only=True)
    species = SpeciesSerializer(many=True, read_only=True)

    class Meta:
        model = World
        fields = ['id', 'name', 'blurb', 'category', 'genres', 'description', 'geoDynamics', 'magicTechnology', 'img', 'imgs', 'species', 'locations', 'characters', 'events', 'lore']
