import pytest
from events.models import Event
from fixtures.worlds import mock_worlds


@pytest.fixture
def mock_events(mock_worlds):
    event1 = Event.objects.create(
        name='Fall of an empire',
        type='War',
        age='First Epoch',
        time='200',
        lore='The battle of the ages',
        imagine='An epic battle',
        img='event.png',
        imgs=[],
        location='',
        world=mock_worlds[0],
    )
    event2 = Event.objects.create(
        name='Start of a dynasty',
        type='Prosperity',
        age='Second Epoch',
        time='400',
        lore='A time of abundance',
        imagine='Beautiful farmlands and forests',
        img='event.png',
        imgs=[],
        location='',
        world=mock_worlds[0],
    )
    event3 = Event.objects.create(
        name='Fall of an empire',
        type='War',
        age='First Epoch',
        time='200',
        lore='The battle of the ages',
        imagine='An epic battle',
        img='event.png',
        imgs=[],
        location='',
        world=mock_worlds[1],
    )
    event4 = Event.objects.create(
        name='Start of a dynasty',
        type='Prosperity',
        age='Second Epoch',
        time='400',
        lore='A time of abundance',
        imagine='Beautiful farmlands and forests',
        img='event.png',
        imgs=[],
        location='',
        world=mock_worlds[1],
    )
    return event1, event2, event3, event4
