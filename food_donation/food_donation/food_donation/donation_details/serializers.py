from rest_framework import serializers
from donation_details.models import DonationDetails
from user_reg.serializers import android_serialiser


class android_serialiser(serializers.ModelSerializer):
    dname = serializers.CharField(source='d.user_name')
    # rname=serializers.CharField(source='r.user_name')
    r=android_serialiser()
    class Meta:
        model=DonationDetails
        # fields=['dname','donation_id','r_id','address','date','time','status','donation_details']
        fields="__all__"
