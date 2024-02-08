from django.db import models

class Species(models.Model):
    name = models.CharField(max_length=250)
    alignment = models.CharField(max_length=250)
    politics = models.TextField()
    lore = models.TextField()
    imagine = models.TextField()
    img = models.TextField(default='none')
    imgs = models.JSONField(default=list)
    world = models.ForeignKey("worlds.World", on_delete=models.CASCADE)
    type = models.CharField(max_length=250, default='none')

    def __str__(self):
        return str(self.id) + " " + self.name
