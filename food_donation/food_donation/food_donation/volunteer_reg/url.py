from django.conf.urls import url
from volunteer_reg import views

urlpatterns = [
    url('volunteer_register/', views.volunteer_register),
]