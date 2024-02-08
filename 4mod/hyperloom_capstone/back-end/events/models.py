from django.db import models

class Event(models.Model):
    name = models.CharField(max_length=250, default='')
    type = models.CharField(max_length=250, default='')
    age = models.CharField(max_length=250, default='')
    time = models.CharField(max_length=250, default='')
    lore = models.TextField(default='')
    imagine = models.TextField(default='')
    img = models.TextField(default='none')
    imgs = models.JSONField(default=list)
    world = models.ForeignKey("worlds.World", on_delete=models.CASCADE)
    location = models.CharField(max_length=250, default='')


    def __str__(self):
        return str(self.id)
