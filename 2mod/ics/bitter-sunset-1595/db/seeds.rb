# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)
