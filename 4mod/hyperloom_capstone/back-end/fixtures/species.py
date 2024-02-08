import pytest
from species.models import Species
from fixtures.worlds import mock_worlds


@pytest.fixture
def mock_species(mock_worlds):
    species1 = Species.objects.create(
        name= 'Aqua knights',
        alignment= 'Neutral Good',
        politics= 'Democratic Confederation',
        lore= 'Aqua knights are beings with toughened skin',
        imagine= 'Glimmering entities swimming through warm, glowing waters',
        img='species.png',
        imgs=[],
        type='none',
        world=mock_worlds[0]
    )
    species2 = Species.objects.create(
        name= 'Night Demons',
        alignment= 'Chaotic Evil',
        politics= 'Anarchist',
        lore= 'Demons from the underverse',
        imagine= 'Demonic beings with horns',
        img='species.png',
        imgs=[],
        type='none',
        world=mock_worlds[0]
    )
    species3 = Species.objects.create(
        name= 'Aqua knights',
        alignment= 'Neutral Good',
        politics= 'Democratic Confederation',
        lore= 'Aqua knights are beings with toughened skin',
        imagine= 'Glimmering entities swimming through warm, glowing waters',
        img='species.png',
        imgs=[],
        type='none',
        world=mock_worlds[1]
    )
    species4 = Species.objects.create(
        name= 'Night Demons',
        alignment= 'Chaotic Evil',
        politics= 'Anarchist',
        lore= 'Demons from the underverse',
        imagine= 'Demonic beings with horns',
        img='species.png',
        imgs=[],
        type='none',
        world=mock_worlds[1]
    )
    return species1, species2, species3, species4
