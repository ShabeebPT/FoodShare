from complaint import views
from django.conf.urls import url


urlpatterns=[
    url('post_rply/(?P<idd>\w+)', views.post_reply),
    url('view_cmplnt/', views.view_complaint),
    url('post_complaint/', views.post_complaint.as_view()),
    url('view_replay/', views.view_reply.as_view()),

]