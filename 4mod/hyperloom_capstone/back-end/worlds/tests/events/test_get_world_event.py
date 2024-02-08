import pytest
from django.urls import reverse
from rest_framework.test import APIClient
from fixtures.events import mock_events
from fixtures.worlds import mock_worlds


@pytest.mark.django_db
def test_get_world_event_happy(mock_events, mock_worlds):
    client = APIClient()
    url_ids = {'world_id': mock_worlds[0].id, 'id': mock_events[0].id}

    url = reverse('get_world_event', kwargs=url_ids)
    response = client.get(url)

    assert response.status_code == 200
    event = response.json()

    assert type(event) is dict

    assert 'id' in event
    assert 'name' in event
    assert 'type' in event
    assert 'age' in event
    assert 'time' in event
    assert 'lore' in event
    assert 'imagine' in event
    assert 'img' in event
    assert 'imgs' in event
    assert 'location' in event
    assert 'world' in event

    assert type(event['id']) is int
    assert type(event['name']) is str
    assert type(event['type']) is str
    assert type(event['age']) is str
    assert type(event['time']) is str
    assert type(event['lore']) is str
    assert type(event['imagine']) is str
    assert type(event['img']) is str
    assert type(event['imgs']) is list
    assert type(event['location']) is str
    assert type(event['world']) is int


@pytest.mark.django_db
def test_get_world_event_invalid_world(mock_events):
    client = APIClient()
    url_ids = {'world_id': 5678, 'id': mock_events[0].id}
    url = reverse('get_world_location', kwargs=url_ids)
    response = client.get(url)

    assert response.status_code == 404


@pytest.mark.django_db
def test_get_world_event_invalid_location(mock_worlds):
    client = APIClient()
    url_ids = {'world_id': mock_worlds[0].id, 'id': 5678}
    url = reverse('get_world_location', kwargs=url_ids)
    response = client.get(url)

    assert response.status_code == 404
