from rest_framework import serializers
from excess_food_report.models import ExcessFoodReport


class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=ExcessFoodReport
        fields='__all__'