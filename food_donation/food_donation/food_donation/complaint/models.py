from django.db import models
from user_reg.models import UserReg
# Create your models here.

class Complaint(models.Model):
    complaint_id = models.AutoField(primary_key=True)
    complaint_details = models.CharField(max_length=50)
    # r_id = models.IntegerField()
    r=models.ForeignKey(UserReg,on_delete=models.CASCADE)
    reply = models.CharField(max_length=50)
    date = models.DateField()
    time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'complaint'


