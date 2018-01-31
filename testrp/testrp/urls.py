from django.conf.urls import include, url

from .views import HomePageView


urlpatterns = [
    url(r'^oidc/', include('mozilla_django_oidc.urls')),
    url(r'^$', HomePageView.as_view(), name='home')
]
