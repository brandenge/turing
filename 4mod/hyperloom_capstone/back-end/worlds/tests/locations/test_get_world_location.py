import pytest
from django.urls import reverse
from rest_framework.test import APIClient
from fixtures.locations import mock_locations
from fixtures.worlds import mock_worlds


@pytest.mark.django_db
def test_get_world_location_happy(mock_locations, mock_worlds):
    client = APIClient()
    url_ids = {'world_id': mock_worlds[0].id, 'id': mock_locations[0].id}
    url = reverse('get_world_location', kwargs=url_ids)
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
def test_get_world_location_invalid_world(mock_locations):
    client = APIClient()
    url_ids = {'world_id': 5678, 'id': mock_locations[0].id}
    url = reverse('get_world_location', kwargs=url_ids)
    response = client.get(url)

    assert response.status_code == 404


@pytest.mark.django_db
def test_get_world_location_invalid_location(mock_worlds):
    client = APIClient()
    url_ids = {'world_id': mock_worlds[0].id, 'id': 5678}
    url = reverse('get_world_location', kwargs=url_ids)
    response = client.get(url)

    assert response.status_code == 404
