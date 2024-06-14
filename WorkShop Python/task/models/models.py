from django.db import models

class task (models.Mdel):
    title = models.CharField(mas_length=255)
    descriptions = models.TextField
    created_at = models.DataTimeField(auto_new_add = True)
    updated_at = models.DataTimeField(auto_new=True)
    completed = models = models.BooleanField(default=False)
