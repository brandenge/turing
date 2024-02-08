import pytest
from worlds.models import World


@pytest.fixture
def mock_worlds():
    world1 = World.objects.create(
        name='Magic World',
        blurb='A magical world',
        category='Fantasy',
        genres=['Fairy Tale'],
        description='A world of high fantasy and powerful magics',
        discovered=True,
        earthly=False,
        geoDynamics={
            'size': 'massive',
            'shape': 'round',
            'climate': 'tropical',
            'landscapes': ['a deep valley']
        },
        magicTechnology={
            'magic': ['light', 'dark'],
            'techLvl': 4,
            'magicLvl': 9,
            'technology': ['metalworking']
        },
        img={
            'hero': 'https://imgur.com/gallery/hero123.png',
            'landscape': 'https://imgur.com/gallery/landscape123.png',
            'thumbnail': 'https://imgur.com/gallery/thumbnail123.png'
        },
        imgs={
            'heros': ['https://imgur.com/gallery/hero123.png'],
            'landscapes': ['https://imgur.com/gallery/landscape123.png'],
            'thumbnails': ['https://imgur.com/gallery/thumbnail123.png']
        },
        lore=['A world of high fantasy and powerful magics']
    )
    world2 = World.objects.create(
        name='Techno World',
        blurb='A technological world',
        category='Science Fiction',
        genres=['Futuristic'],
        description='A world of advanced technology',
        discovered=True,
        earthly=True,
        geoDynamics={
            'size': 'massive',
            'shape': 'round',
            'climate': 'temperate',
            'landscapes': ['a tall mountain']
        },
        magicTechnology={
            'magic': ['light', 'dark'],
            'techLvl': 9,
            'magicLvl': 2,
            'technology': ['Rocket ships']
        },
        img={
            'hero': 'https://imgur.com/gallery/hero456.png',
            'landscape': 'https://imgur.com/gallery/landscape456.png',
            'thumbnail': 'https://imgur.com/gallery/thumbnail456.png'
        },
        imgs={
            'heros': ['https://imgur.com/gallery/hero456.png'],
            'landscapes': ['https://imgur.com/gallery/landscape456.png'],
            'thumbnails': ['https://imgur.com/gallery/thumbnail456.png']
        },
        lore=['A world of advanced technology']
    )
    world3 = World.objects.create(
        name='Magic World',
        blurb='A magical world',
        category='Fantasy',
        genres=['Fairy Tale'],
        description='A world of high fantasy and powerful magics',
        discovered=False,
        earthly=True,
        geoDynamics={
            'size': 'massive',
            'shape': 'round',
            'climate': 'tropical',
            'landscapes': ['a deep valley']
        },
        magicTechnology={
            'magic': ['light', 'dark'],
            'techLvl': 4,
            'magicLvl': 9,
            'technology': ['metalworking']
        },
        img={
            'hero': 'https://imgur.com/gallery/hero123.png',
            'landscape': 'https://imgur.com/gallery/landscape123.png',
            'thumbnail': 'https://imgur.com/gallery/thumbnail123.png'
        },
        imgs={
            'heros': ['https://imgur.com/gallery/hero123.png'],
            'landscapes': ['https://imgur.com/gallery/landscape123.png'],
            'thumbnails': ['https://imgur.com/gallery/thumbnail12.png']
        },
        lore=['A world of high fantasy and powerful magics']
    )
    world4 = World.objects.create(
        name='Techno World',
        blurb='A technological world',
        category='Science Fiction',
        genres=['Futuristic'],
        description='A world of advanced technology',
        discovered=False,
        earthly=True,
        geoDynamics={
            'size': 'massive',
            'shape': 'round',
            'climate': 'temperate',
            'landscapes': ['a tall mountain']
        },
        magicTechnology={
            'magic': ['light', 'dark'],
            'techLvl': 9,
            'magicLvl': 2,
            'technology': ['Rocket ships']
        },
        img={
            'hero': 'https://imgur.com/gallery/hero456.png',
            'landscape': 'https://imgur.com/gallery/landscape456.png',
            'thumbnail': 'https://imgur.com/gallery/thumbnail456.png'
        },
        imgs={
            'heros': ['https://imgur.com/gallery/hero456.png'],
            'landscapes': ['https://imgur.com/gallery/landscape456.png'],
            'thumbnails': ['https://imgur.com/gallery/thumbnail456.png']
        },
        lore=['A world of advanced technology']
    )
    return world1, world2, world3, world4
