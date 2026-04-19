require "faraday"
require "json"

class SwapiClient
  BASE_URL = "https://swapi.dev/api"

  def self.get_resource(resource, page)
    response = Faraday.get("#{BASE_URL}/#{resource}", { page: page })
    JSON.parse(response.body)
  end

  def self.get_resource_item(resource, id)
    response = Faraday.get("#{BASE_URL}/#{resource}/#{id}")
    JSON.parse(response.body)
  end
end
