import random

def random_attributes():
    earthly = random.choices(["earthly", "otherworldly"], weights=[0.42, 0.58], k=1)[0]
    return {
        "earthly": earthly_bool(earthly),
        "genres": aesthetics_sample(earthly),
        "geoDynamics": {
            "size": size_sample(earthly),
            "shape": shape_sample(earthly),
            "climate": climate_sample(earthly),
            "landscapes": landscapes_sample(earthly)
        },
        "magicTechnology": {
            "magicLvl": random.randint(0,10),
            "techLvl": random.randint(0,10),
        }
    }


def earthly_bool(earthly):
    return True if earthly == "earthly" else False


def aesthetics_sample(earthly):
    return random.sample(AESTHETICS[earthly], random.randint(1,3))


def size_sample(earthly):
    return random.sample(GEODYNAMICS["size"][earthly], 1)[0]


def shape_sample(earthly):
    return random.sample(GEODYNAMICS["shape"][earthly], 1)[0]


def climate_sample(earthly):
    return random.sample(GEODYNAMICS["climate"][earthly], 1)[0]
    

def landscapes_sample(earthly):
    if earthly == "earthly":
        return random.sample(GEODYNAMICS["landscapes"]["earthly"], random.randint(2,3))
    else:
        landscapes = []
        for _ in range(random.randint(2,3)):
            landscapes.append(random.sample(GEODYNAMICS["landscapes"][earthly], 1)[0] + " " + random.sample(GEODYNAMICS["landscapes"]["earthly"], 1)[0])
        return landscapes
    
def categorize_world(world):
    for category, category_genres in CATEGORIES.items():
        if world.genres[0] in category_genres:
            world.category = category
    
CATEGORIES = {
    "Historical & Cultural": 
        ["1950s Suburbia"
        ,"American Pioneers"
        ,"American Revolution"
        ,"Americana"
        ,"Ancient Egypt"
        ,"Art Deco"
        ,"Art Nouveau"
        ,"Baroque"
        ,"Bauhaus"
        ,"Classicism"
        ,"Danish Pastel"
        ,"Elizabethan England"
        ,"Gothic"
        ,"Impressionism"
        ,"Italian Renaissance"
        ,"Medieval"
        ,"Neoclassicism"
        ,"Neo-Romanism"
        ,"Old Hollywood"
        ,"Pre-Raphaelite"
        ,"Romanticism"
        ,"Victorian"
        ,"World War II"],

    "Nature & Environment":
        ["Autumn"
        ,"Australian Outback"
        ,"Beach Day"
        ,"Cabincore"
        ,"Cottagecore"
        ,"Desertwave"
        ,"Earthcore"
        ,"Forestpunk"
        ,"Gardencore"
        ,"Golden Hour"
        ,"Grasscore"
        ,"Highlandcore"
        ,"Junglecore"
        ,"Naturecore"
        ,"Ocean Academia"
        ,"Ocean Grunge"
        ,"Rusticcore"
        ,"Swampcore"],

    "Urban & Modern":
        ["Abstract Tech"
        ,"Atompunk"
        ,"City Pop"
        ,"Cyberprep"
        ,"Decopunk"
        ,"Diner"
        ,"Miami Metro"
        ,"Midwest Gothic"
        ,"Minimalism"
        ,"Nuclear"
        ,"Suburban"
        ,"Vintage"],

    "Fantasy & Mystical":
        ["Alien"
        ,"Dark Fantasy"
        ,"Ethereal"
        ,"Fairy Tale"
        ,"Fantasy"
        ,"Medieval Fantasy"
        ,"Surrealism"],

    "Futuristic & Tech":
        ["Afrofuturism"
        ,"Clockpunk"
        ,"Cyberdelic"
        ,"Cyberpunk"
        ,"Futurism"
        ,"Gadgetpunk"
        ,"Icepunk"
        ,"Retro-Futurism"
        ,"Silkpunk"
        ,"Spacecore"
        ,"Steampunk"
        ,"Transhumanism"
        ,"Underwater"
        ,"Utopiacore"
        ,"Wavepunk"
        ,"Woodpunk"],

    "Miscellaneous & Niche":
        ["Auroracore"
        ,"Goblincore"
        ,"Military"
        ,"Monumentality"
        ,"Mushroomcore"
        ,"Nautical"
        ,"New England Gothic"
        ,"Paleocore"
        ,"Pirate"
        ,"Post-Apocalyptic"
        ,"Prehistoricore"
        ,"Sandalpunk"
        ,"Seapunk"
        ,"Stonecore"]
}

    
    
AESTHETICS = {
"earthly": [
"1950s Suburbia",
"Abstract Tech",
"Afrofuturism",
"American Pioneers",
"American Revolution",
"Americana",
"Ancient Egypt",
"Art Deco",
"Art Nouveau",
"Atompunk",
"Australian Outback",
"Autumn",
"Baroque",
"Bauhaus",
"Beach Day",
"Cabincore",
"City Pop",
"Classicism",
"Cottagecore",
"Cyberprep",
"Danish Pastel",
"Dark Nautical",
"Decopunk",
"Desertwave",
"Diner",
"Earthcore",
"Elizabethan England",
"Forestpunk",
"Gardencore",
"Goblincore",
"Golden Hour",
"Gothic",
"Grasscore",
"Highlandcore",
"Impressionism",
"Italian Renaissance",
"Junglecore",
"Medieval",
"Miami Metro",
"Midwest Gothic",
"Military",
"Minimalism",
"Monumentality",
"Mushroomcore",
"Naturecore",
"Nautical",
"Neoclassicism",
"Neo-Romanism",
"New England Gothic",
"Nuclear",
"Ocean Academia",
"Ocean Grunge",
"Old Hollywood",
"Paleocore",
"Pirate",
"Pre-Raphaelite",
"Retro-Futurism",
"Romanticism",
"Rusticcore",
"Sandalpunk",
"Seapunk",
"Stonecore",
"Suburban",
"Swampcore",
"Victorian",
"Vintage",
"World War II"
],
"otherworldly": [
"Abstract Tech",
"Alien",
"Artificial Nature",
"Atompunk",
"Auroracore",
"Clockpunk",
"Cyberdelic",
"Cyberpunk",
"Cyberprep",
"Dark Fantasy",
"Decopunk",
"Ethereal",
"Fairy Tale",
"Fantasy",
"Futurism",
"Gadgetpunk",
"Icepunk",
"Medieval Fantasy",
"Oceanpunk",
"Post-Apocalyptic",
"Prehistoricore",
"Retro-Futurism",
"Seapunk",
"Silkpunk",
"Spacecore",
"Steampunk",
"Surrealism",
"Transhumanism",
"Underwater",
"Utopiacore",
"Wavepunk",
"Woodpunk"
]
}

GEODYNAMICS = {
    "climate": {
        "earthly": [
            "tropical",
            "subtropical",
            "temperate",
            "taiga",
            "polar",
            "Mediterranean",
            "monsoon",
            "savanna",
            "temperate steppe",
            "highland",
            "oceanic",
            "continental",
            "humid subtropical",
            "subarctic",
            "humid continental",
            "semi-arid",
            "arid"
        ],
        "otherworldly": [
            "crystal-infused",
            "time-distorting",
            "spirit-infused",
            "dimension-shifting",
            "ethereal ghost",
            "bioluminescent",
            "singing",
            "lava-filled",
            "neon-charged",
            "gravity-reversed",
            "psychotropic",
            "stardust-swept",
            "aether-kissed",
            "dream-woven",
            "frozen in time",
            "obsidian-encrusted"
        ]
    },
    "landscapes": {
        "earthly": [
            "rolling hills",
            "steep mountains",
            "dense forests",
            "wide plains",
            "towering waterfalls",
            "deep valleys",
            "cavernous caves",
            "meandering rivers",
            "sandy beaches",
            "lush wetlands",
            "frozen glaciers",
            "volcanic ashlands",
            "rocky desert",
            "salt flats",
            "coral reefs",
            "mangrove swamps",
            "fjords",
            "gorges",
            "plateaus",
            "tundra",
            "taiga", 
            "canals"
        ],
        "otherworldly": [
            "floating",
            "flowing upwards",
            "bioluminescent flora",
            "shifting glass",
            "glowing",
            "whispering",
            "phasing in and out of reality",
            "suspended in bubbles",
            "mirrored",
            "crystal-encrusted",
            "shadow-shrouded",
            "vibrating",
            "fractal",
            "echoing with unseen voices",
            "drifting between dimensions"
        ]
    },
    "size": {
        "earthly": ["Dwarf", "Earth-like", "Vast"],
        "otherworldly": ["Limitless", "Pocket Dimension", "Expanding/Contracting", "Tiny but with Huge Inner Space", "Vast but Dense with Tiny Inner Space"]
    },
    "shape": {
        "earthly": ["Planet"],
        "otherworldly": ["Cube", "Ringworld", "Dyson Sphere", "Torus", "Flatworld", "Hyperboloid", "Living Planet", "Sentient Nebula", "Star-Whale", "Immaterial Plane", "Tesseract", "Fractal Dimension", "Dreamworld"],
    },
    "time": {
        "earthly": "linear",
        "otherworldly": ["Timeless", "Eternal Day/Night", "Fluctuating Time Speed", "Retrograde Time", "Non-linear Time", "Simultaneous Past-Present-Future"],
    },
    "physics": {
        "earthly": ["Earthly"],
        "otherworldly": ["Phasing In/Out", "Temporally Unstable", "Constructed from Ideas", "Constructed from Memories", "Constructed from Emotions"]
    },
    "life": {
        "earthly": ["Flourishing Ecosystems", "High Bio-Diversity", "Endangered Balance"],
        "otherworldly": ["Single Dominant Species", "Uniform Flora", "Life as Energy", "Life as Information"]
    }
}

