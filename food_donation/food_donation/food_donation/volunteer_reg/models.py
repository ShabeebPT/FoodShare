from django.db import models

# Create your models here.

class VolunteerReg(models.Model):
    user_name = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    v_id = models.AutoField(primary_key=True)
    address = models.CharField(max_length=50)
    ph_no = models.CharField(max_length=50)
    latitude = models.CharField(max_length=45)
    longitude = models.CharField(max_length=45)
    vol_no = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'volunteer_reg'
