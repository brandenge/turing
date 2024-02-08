import pytest
from django.urls import reverse
from rest_framework.test import APIClient
from fixtures.worlds import mock_worlds


@pytest.mark.django_db
def test_get_world_list_happy(mock_worlds):
    client = APIClient()
    url = reverse('get_world_list')
    response = client.get(url)

    assert response.status_code == 200
    world_list = response.json()

    assert type(world_list) is list
    assert(len(world_list)) == 2

    for world in world_list:
        assert 'id' in world
        assert 'name' in world
        assert 'blurb' in world
        assert 'category' in world
        assert 'genres' in world
        assert 'description' in world
        assert 'geoDynamics' in world
        assert 'magicTechnology' in world
        assert 'img' in world
        assert 'imgs' in world
        assert 'species' in world
        assert 'locations' in world
        assert 'characters' in world
        assert 'events' in world
        assert 'lore' in world

        assert 'size' in world['geoDynamics']
        assert 'shape' in world['geoDynamics']
        assert 'climate' in world['geoDynamics']
        assert 'landscapes' in world['geoDynamics']
        assert 'magic' in world['magicTechnology']
        assert 'techLvl' in world['magicTechnology']
        assert 'magicLvl' in world['magicTechnology']
        assert 'technology' in world['magicTechnology']
        assert 'hero' in world['img']
        assert 'landscape' in world['img']
        assert 'thumbnail' in world['img']
        assert 'heros' in world['imgs']
        assert 'landscapes' in world['imgs']
        assert 'thumbnails' in world['imgs']

        assert type(world['id']) is int
        assert type(world['name']) is str
        assert type(world['blurb']) is str
        assert type(world['category']) is str
        assert type(world['genres']) is list
        assert type(world['description']) is str
        assert type(world['geoDynamics']) is dict
        assert type(world['magicTechnology']) is dict
        assert type(world['img']) is dict
        assert type(world['imgs']) is dict
        assert type(world['species']) is list
        assert type(world['locations']) is list
        assert type(world['characters']) is list
        assert type(world['events']) is list
        assert type(world['lore']) is list

        assert type(world['geoDynamics']['size']) is str
        assert type(world['geoDynamics']['shape']) is str
        assert type(world['geoDynamics']['climate']) is str
        assert type(world['geoDynamics']['landscapes']) is list
        assert type(world['magicTechnology']['magic']) is list
        assert type(world['magicTechnology']['techLvl']) is int
        assert type(world['magicTechnology']['magicLvl']) is int
        assert type(world['magicTechnology']['technology']) is list
        assert type(world['img']['hero']) is str
        assert type(world['img']['landscape']) is str
        assert type(world['img']['thumbnail']) is str
        assert type(world['imgs']['heros']) is list
        assert type(world['imgs']['landscapes']) is list
        assert type(world['imgs']['thumbnails']) is list

        for genre in world['genres']:
            assert(type(genre)) is str

        for landscape in world['geoDynamics']['landscapes']:
            assert(type(landscape)) is str

        for magic in world['magicTechnology']['magic']:
            assert(type(magic)) is str

        for technology in world['magicTechnology']['technology']:
            assert(type(technology)) is str

        for hero in world['imgs']['heros']:
            assert(type(hero)) is str

        for landscape in world['imgs']['landscapes']:
            assert(type(landscape)) is str

        for thumbnail in world['imgs']['thumbnails']:
            assert(type(thumbnail)) is str

        for species in world['species']:
            assert(type(species)) is dict

        for location in world['locations']:
            assert(type(location)) is dict

        for event in world['events']:
            assert(type(event)) is dict

        for character in world['characters']:
            assert(type(character)) is dict
