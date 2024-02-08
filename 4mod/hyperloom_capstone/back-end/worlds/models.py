from django.db import models
from species.models import Species
from events.models import Event
from locations.models import Location
from characters.models import Character
import re

class World(models.Model):
    name = models.CharField(max_length=250)
    discovered = models.BooleanField(default=False)
    earthly = models.BooleanField(default=True)
    category = models.CharField(max_length=250, default='')
    genres = models.JSONField(default=list)
    blurb = models.CharField(max_length=250)
    description = models.TextField(default='')
    geoDynamics = models.JSONField(default=dict)
    magicTechnology = models.JSONField(default=dict)
    lore = models.JSONField(default=list)
    imagine = models.TextField(default='')
    img = models.JSONField(default=dict)
    imgs = models.JSONField(default=dict)


    @property
    def locations(self):
        return self.location_set.all()

    @property
    def characters(self):
        return self.character_set.all()

    @property
    def events(self):
        return self.event_set.all()

    @property
    def species(self):
        return self.species_set.all()

    @property
    def is_complete(self):
        pattern = re.compile(r"\.png$")

        if isinstance(self.img, dict):
            thumbnail_img = self.img.get("thumbnail", None)
            landscape_img = self.img.get("landscape", None)

            if not (thumbnail_img and landscape_img and pattern.search(thumbnail_img) and pattern.search(landscape_img)):
                return False
        else:
            if not pattern.search(self.img):
                return False

        for model in [self.locations, self.events, self.characters, self.species]:
            for instance in model:
                if isinstance(instance.img, str) and not pattern.search(instance.img):
                    return False

        return True

    def __str__(self):
        return str(self.id) + " " + self.name
