def gpt_prompt(params):
    return f"""
Please describe a world in vivid detail with the following features:

{params}

If any of the above attributes contradict each other, you may adjust them as needed.

Include descriptions of:
  - the world's landscapes,
  - 1-3 of its major species,
  - 2 of their cities/settlements/colonies, and one other significant location,
  - a significant character for each location,
  - and a significant event each character participated in.
Based on these, describe an overview of the world's historical lore in three epochs.

Your response should follow this structure:
{{
  "earthly": Boolean,
  "genres": [aesthetic genres]
  "geoDynamics": {{
    "size": (scope),
    "shape": (metastructure),
    "climate": (natural conditions),
    "landscapes": (major or typical features)
  }},
  "magicTechnology": {{
    "magicLvl": (Integer),
    "magic": (add types and powers of magic based on magicLvl as an array of strings),
    "techLvl": (Integer),
    "technology": (add types and powers of tech based on techLvl as an array of strings)
  }},
  "name": (a creative name based on the above features. may be inspired by genre but should not directly use genre names),
  "blurb": (a brief one-liner about the world),
  "description": (a detailed one-two paragraph description),
  "imagine": (a highly detailed, visually and stylistically descriptive, one-paragraph image prompt for a landscape view of the world),
  "species": [{{
    "alignment": (DnD alignment),
    "politics": (political/societal structure and temperament),
    "name": (name of species),
    "lore": (detailed lore),
    "imagine": (an image prompt, highly detailed, visually and stylistically descriptive,
    one paragraph long. each such prompt should be a standalone natural language
    description that doesn't refer to the names of the subjects and doesn't contain any suggestive terms that may be banned by an image generation api)
  }}],
  "locations": [{{
    "type": (eg city, settlement, landmark, monument),
    "climate": (local microclimate),
    "name": (name),
    "lore": (description),
    "imagine": (image prompt)
  }}],
  "characters": [{{
    "species": (name of species),
    "age": (must be an Integer),
    "alignment": (DnD alignment),
    "name": (name),
    "lore": (description),
    "imagine": (image prompt with no names and no suggestive terms that may be filtered by an ai safety syste)
  }}],
  "events": [{{
    "type": (type of event),
    "age": (the epoch of the world),
    "location": (location from above),
    "time": (calendar year),
    "name": (name),
    "lore": (description),
    "imagine": (image prompt)
  }}],
  "lore": [(three strings, each one-two paragraphs long, describing the evolution of the world in ages/epochs/etc, incorporating the above information)]
}}
"""

