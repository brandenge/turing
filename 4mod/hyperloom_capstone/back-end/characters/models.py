from django.db import models

class Character(models.Model):
    name = models.CharField(max_length=250)
    species = models.CharField(max_length=250)
    alignment = models.CharField(max_length=250)
    age = models.IntegerField()
    lore = models.TextField()
    imagine = models.TextField()
    img = models.TextField(default='none')
    imgs = models.JSONField(default=list)
    world = models.ForeignKey("worlds.World", on_delete=models.CASCADE)
    location = models.CharField(max_length=250, default='')


    def __str__(self):
        return str(self.id) + " " + self.name
