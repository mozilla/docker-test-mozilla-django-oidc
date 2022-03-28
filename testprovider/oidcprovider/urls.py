from django.contrib import admin
from django.urls import include, path

from .views import HomePageView

urlpatterns = [
    path("openid/", include("oidc_provider.urls", namespace="oidc_provider")),
    # path('account/', include('django.contrib.auth.urls')),
    path("account/", include("account.urls")),
    path("admin/", admin.site.urls),
    path("", HomePageView.as_view(), name="home"),
]
