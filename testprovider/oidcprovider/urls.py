from django.contrib import admin
from django.urls import include, path

from oidcprovider import views

urlpatterns = [
    path("openid/", include("oidc_provider.urls", namespace="oidc_provider")),
    # path('account/', include('django.contrib.auth.urls')),
    path("user/delete", views.delete_user, name="delete_user"),
    path("account/", include("account.urls")),
    path("admin/", admin.site.urls),
    path("", views.HomePageView.as_view(), name="home"),
]
