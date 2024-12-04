from django.db import models

# Create your models here.

class UserReg(models.Model):
    r_id = models.AutoField(primary_key=True)
    password = models.CharField(max_length=50)
    user_name = models.CharField(max_length=50)
    ph_no = models.CharField(max_length=50)
    latitude = models.CharField(max_length=45)
    longitude = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'user_reg'