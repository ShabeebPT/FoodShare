from django.db import models
from donor_reg.models import DonorReg
# Create your models here.

class ExcessFoodReport(models.Model):
    efr_id = models.AutoField(primary_key=True)
    # d_id = models.IntegerField()
    d = models.ForeignKey(DonorReg,on_delete=models.CASCADE)
    food_details = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'excess_food_report'
