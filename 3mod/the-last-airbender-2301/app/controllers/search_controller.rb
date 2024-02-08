class SearchController < ApplicationController
  API_DOMAIN = 'https://last-airbender-api.fly.dev'.freeze
  DEFAULT_IMAGE_URL = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'.freeze

  def index
    @affiliation = params[:nation].split(/[+ ]/).map(&:capitalize).join(' ')
    all_characters = get_url("#{API_DOMAIN}/api/v1/characters?perPage=1000")
    characters = all_characters.filter do |character|
      character[:affiliation] && character[:affiliation].downcase.include?(@affiliation.downcase)
    end
    @characters = characters.map do |character|
      if character[:photoUrl].nil?
        character[:photoUrl] = DEFAULT_IMAGE_URL
      end
      if character[:allies].empty?
        character[:allies] = 'None'
      end
      if character[:enemies].empty?
        character[:enemies] = 'None'
      end
      character
    end
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: API_DOMAIN,
                headers: { 'Content-Type' => 'application/json' })
  end
end
