from rest_framework import serializers
from donor_reg.models import DonorReg


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=DonorReg
        fields='__all__'