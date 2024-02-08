from django.db import models

class Location(models.Model):
    name = models.CharField(max_length=250)
    type = models.CharField(max_length=250)
    climate = models.CharField(max_length=250)
    lore = models.TextField()
    imagine = models.TextField()
    img = models.TextField(default='none')
    imgs = models.JSONField(default=list)
    world = models.ForeignKey("worlds.World", on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id) + " " + self.name
