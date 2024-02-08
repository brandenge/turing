require 'httparty'
require 'json'
require 'pry'
require './lib/film.rb'

response = HTTParty.get("https://limitless-castle-00011.herokuapp.com/films")

parsed_response = JSON.parse(response.body, symbolize_names: true)

require 'pry-byebug'; require 'pry'; binding.pry;

films = parsed_response.map do |data|
  Film.new(data)
end

films.each do |film|
  puts film.title
  puts "Directed By: #{film.director}"
  puts "Produced By: #{film.producer}"
  puts "Rotten Tomatoes Score: #{film.rotten_tomatoes}"
  puts ""
end
