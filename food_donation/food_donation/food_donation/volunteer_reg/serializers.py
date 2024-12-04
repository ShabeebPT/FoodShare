from rest_framework import serializers
from volunteer_reg.models import VolunteerReg


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=VolunteerReg
        fields='__all__'