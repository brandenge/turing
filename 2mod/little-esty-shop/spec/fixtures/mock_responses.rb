module MockResponses
  LOGO_PHOTO_RESPONSE = {
    "id": "qMehmIyaXvY",
    "description": nil,
    "urls": {
      "raw": "https://images.unsplash.com/photo-1583686298564-46fbffda0707?ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzQ3MTk&ixlib=rb-4.0.3",
      "full": "https://images.unsplash.com/photo-1583686298564-46fbffda0707?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzQ3MTk&ixlib=rb-4.0.3&q=85",
      "regular": "https://images.unsplash.com/photo-1583686298564-46fbffda0707?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzQ3MTk&ixlib=rb-4.0.3&q=80&w=1080",
      "small": "https://images.unsplash.com/photo-1583686298564-46fbffda0707?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzQ3MTk&ixlib=rb-4.0.3&q=80&w=400",
      "thumb": "https://images.unsplash.com/photo-1583686298564-46fbffda0707?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzQ3MTk&ixlib=rb-4.0.3&q=80&w=200"
    },
    "width": 6720,
    "height": 4480,
    "likes": 111
  }.freeze

  RANDOM_PHOTO_RESPONSE = {
    "id": "cyJ-RWZhRhw",
    "description": nil,
    "urls": {
      "raw": "https://images.unsplash.com/photo-1681519488861-be9e0a3e905a?ixid=Mnw0MzczNTV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODE5MzU0ODU&ixlib=rb-4.0.3",
      "full": "https://images.unsplash.com/photo-1681519488861-be9e0a3e905a?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODE5MzU0ODU&ixlib=rb-4.0.3&q=85",
      "regular": "https://images.unsplash.com/photo-1681519488861-be9e0a3e905a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODE5MzU0ODU&ixlib=rb-4.0.3&q=80&w=1080",
      "small": "https://images.unsplash.com/photo-1681519488861-be9e0a3e905a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODE5MzU0ODU&ixlib=rb-4.0.3&q=80&w=400",
      "thumb": "https://images.unsplash.com/photo-1681519488861-be9e0a3e905a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODE5MzU0ODU&ixlib=rb-4.0.3&q=80&w=200"
    },
    "width": 6760,
    "height": 4507,
    "likes": 43
  }.freeze

  SEARCH_PHOTO_RESPONSE = {
    "results": [
      {
        "id": "Mv9hjnEUHR4",
        "description": "Toshi wearing a knit sweater.",
        "urls": {
          "raw": "https://images.unsplash.com/photo-1517849845537-4d257902454a?ixid=Mnw0MzczNTV8MHwxfHNlYXJjaHwxfHxkb2d8ZW58MHx8fHwxNjgxOTM1Nzc4&ixlib=rb-4.0.3",
          "full": "https://images.unsplash.com/photo-1517849845537-4d257902454a?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHNlYXJjaHwxfHxkb2d8ZW58MHx8fHwxNjgxOTM1Nzc4&ixlib=rb-4.0.3&q=85",
          "regular": "https://images.unsplash.com/photo-1517849845537-4d257902454a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHNlYXJjaHwxfHxkb2d8ZW58MHx8fHwxNjgxOTM1Nzc4&ixlib=rb-4.0.3&q=80&w=1080",
          "small": "https://images.unsplash.com/photo-1517849845537-4d257902454a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHNlYXJjaHwxfHxkb2d8ZW58MHx8fHwxNjgxOTM1Nzc4&ixlib=rb-4.0.3&q=80&w=400",
          "thumb": "https://images.unsplash.com/photo-1517849845537-4d257902454a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfHNlYXJjaHwxfHxkb2d8ZW58MHx8fHwxNjgxOTM1Nzc4&ixlib=rb-4.0.3&q=80&w=200"
        },
        "width": 3024,
        "height": 4032,
        "likes": 2992
      }.freeze
    ].freeze
  }.freeze

  SEARCH_NOT_FOUND_RESPONSE = {
    "results": []
  }.freeze

  ERROR_PHOTO_RESPONSE = {
    "id": "Hl_o1K6OPsA",
    "description": nil,
    "urls": {
      "raw": "https://images.unsplash.com/photo-1591890799331-94ab715fa69e?ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzYxMzM&ixlib=rb-4.0.3",
      "full": "https://images.unsplash.com/photo-1591890799331-94ab715fa69e?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzYxMzM&ixlib=rb-4.0.3&q=85",
      "regular": "https://images.unsplash.com/photo-1591890799331-94ab715fa69e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzYxMzM&ixlib=rb-4.0.3&q=80&w=1080",
      "small": "https://images.unsplash.com/photo-1591890799331-94ab715fa69e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzYxMzM&ixlib=rb-4.0.3&q=80&w=400",
      "thumb": "https://images.unsplash.com/photo-1591890799331-94ab715fa69e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzczNTV8MHwxfGFsbHx8fHx8fHx8fDE2ODE5MzYxMzM&ixlib=rb-4.0.3&q=80&w=200"
    },
    "width": 5890,
    "height": 3927,
    "likes": 235
  }.freeze
end
