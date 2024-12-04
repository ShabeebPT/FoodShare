from rest_framework import serializers
from user_reg.models import UserReg


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=UserReg
        fields='__all__'