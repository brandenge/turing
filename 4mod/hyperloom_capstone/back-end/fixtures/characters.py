import pytest
from characters.models import Character
from fixtures.worlds import mock_worlds


@pytest.fixture
def mock_characters(mock_worlds):
    character1 = Character.objects.create(
        name='Joe Bob',
        species='human',
        alignment='lawful good',
        age=45,
        lore='A respected commander',
        imagine='A warrior',
        img='https://imgur.com/gallery/character123.png',
        imgs=[],
        location='',
        world=mock_worlds[0]
    )
    character2 = Character.objects.create(
        name='Tim',
        species='human',
        alignment='lawful evil',
        age=72,
        lore='An evil villain',
        imagine='A mage',
        img='https://imgur.com/gallery/character456.png',
        imgs=[],
        location='',
        world=mock_worlds[0],
    )
    character3 = Character.objects.create(
        name='Joe Bob',
        species='human',
        alignment='lawful good',
        age=45,
        lore='A respected commander',
        imagine='A warrior',
        img='https://imgur.com/gallery/character123.png',
        imgs=[],
        location='',
        world=mock_worlds[1]
    )
    character4 = Character.objects.create(
        name='Tim',
        species='human',
        alignment='lawful evil',
        age=72,
        lore='An evil villain',
        imagine='A mage',
        img='https://imgur.com/gallery/character456.png',
        imgs=[],
        location='',
        world=mock_worlds[1],
    )
    return character1, character2, character3, character4
