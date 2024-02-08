require 'httparty'
require 'pry'
require 'json'

response = HTTParty.get 'https://api.github.com/users/brandenge'

body = response.body

parsed = JSON.parse(body, symbolize_names: true)

puts parsed
