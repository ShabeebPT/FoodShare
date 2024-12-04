from django.db import models
from donor_reg.models import DonorReg
from user_reg.models import UserReg
# Create your models here.

class DonationDetails(models.Model):
    donation_id = models.AutoField(primary_key=True)
    # d_id = models.IntegerField()
    d = models.ForeignKey(DonorReg, on_delete=models.CASCADE)
    # r_id = models.IntegerField()
    r = models.ForeignKey(UserReg, on_delete=models.CASCADE,null=True)
    address = models.CharField(max_length=50)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=50)
    donation_details = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'donation_details'
