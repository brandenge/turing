"""
URL configuration for worlds project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path
from worlds import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('worlds/', views.world_list, name='get_world_list'),
    path('worlds/<int:id>', views.world_detail, name='get_world'),
    path('locations', views.location_list, name='get_location_list'),
    path('locations/<int:id>', views.location_detail, name='get_location'),
    path('characters', views.character_list, name='get_character_list'),
    path('characters/<int:id>', views.character_detail, name='get_character'),
    path('events', views.event_list, name='get_event_list'),
    path('events/<int:id>', views.event_detail, name='get_event'),
    path('worlds/<int:id>/locations', views.world_locations_list, name='get_world_location_list'),
    path('worlds/<int:world_id>/locations/<int:id>', views.world_location_detail, name='get_world_location'),
    path('worlds/<int:id>/characters', views.world_characters_list, name='get_world_character_list'),
    path('worlds/<int:world_id>/characters/<int:id>', views.world_character_detail, name='get_world_character'),
    path('worlds/<int:id>/events', views.world_events_list, name='get_world_event_list'),
    path('worlds/<int:world_id>/events/<int:id>', views.world_event_detail, name='get_world_event'),
    path('webhook/', views.webhook, name='webhook'),
    path('worlds/discover', views.discover_world, name='get_discover_world'),
]
