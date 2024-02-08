import pytest
from django.urls import reverse
from rest_framework.test import APIClient
from fixtures.locations import mock_locations
from fixtures.worlds import mock_worlds


@pytest.mark.django_db
def test_get_location_happy(mock_locations):
    client = APIClient()
    url = reverse('get_location', kwargs={'id': mock_locations[0].id})
    response = client.get(url)

    assert response.status_code == 200
    location = response.json()

    assert type(location) is dict

    assert 'id' in location
    assert 'name' in location
    assert 'type' in location
    assert 'climate' in location
    assert 'lore' in location
    assert 'imagine' in location
    assert 'img' in location
    assert 'imgs' in location
    assert 'world' in location

    assert type(location['id']) is int
    assert type(location['name']) is str
    assert type(location['type']) is str
    assert type(location['climate']) is str
    assert type(location['lore']) is str
    assert type(location['imagine']) is str
    assert type(location['img']) is str
    assert type(location['imgs']) is list
    assert type(location['world']) is int


@pytest.mark.django_db
def test_get_location_invalid_location():
    client = APIClient()
    url = reverse('get_location', kwargs={'id': 5678})
    response = client.get(url)

    assert response.status_code == 404
