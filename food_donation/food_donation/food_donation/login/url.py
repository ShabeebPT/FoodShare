from django.conf.urls import url
from login import views

urlpatterns = [
    url('login/', views.login),
    url('login_flutter/',views.login_flutter.as_view())


]