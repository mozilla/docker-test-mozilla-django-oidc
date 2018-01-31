from django.conf.urls import include, url
from django.contrib import admin

from .views import HomePageView

urlpatterns = [
    url(r'^openid/', include('oidc_provider.urls', namespace='oidc_provider')),
    url(r'^account/', include('account.urls')),
    url(r'^admin/', admin.site.urls),
    url(r'^$', HomePageView.as_view(), name='home'),

]
