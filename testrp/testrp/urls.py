from django.conf.urls import include, url

from .views import HomePageView, TestAPIView


urlpatterns = [
    url(r'^oidc/', include('mozilla_django_oidc.urls')),
    url(r'^api/$', TestAPIView.as_view(), name='api'),
    url(r'^$', HomePageView.as_view(), name='home')
]
