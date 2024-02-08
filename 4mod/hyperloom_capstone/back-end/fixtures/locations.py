import pytest
from locations.models import Location
from fixtures.worlds import mock_worlds


@pytest.fixture
def mock_locations(mock_worlds):
    location1 = Location.objects.create(
        name='Magic City',
        type='magical',
        climate='tropical',
        lore='A hidden magic city',
        imagine='A magical city',
        img='https://imgur.com/gallery/location123.png',
        imgs=[],
        world=mock_worlds[0]
    )
    location2 = Location.objects.create(
        name='Techno City',
        type='technological',
        climate='temperate',
        lore='A city of advanced technologies',
        imagine='A technological city',
        img='https://imgur.com/gallery/location456.png',
        imgs=[],
        world=mock_worlds[0]
    )
    location3 = Location.objects.create(
        name='Magic City',
        type='magical',
        climate='tropical',
        lore='A hidden magic city',
        imagine='A magical city',
        img='https://imgur.com/gallery/location123.png',
        imgs=[],
        world=mock_worlds[1]
    )
    location4 = Location.objects.create(
        name='Techno City',
        type='technological',
        climate='temperate',
        lore='A city of advanced technologies',
        imagine='A technological city',
        img='https://imgur.com/gallery/location456.png',
        imgs=[],
        world=mock_worlds[1]
    )
    return location1, location2, location3, location4
