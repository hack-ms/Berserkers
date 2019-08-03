class Populate::Cities < BaseService
  include BaseApi

  ENDPOINT = "https://avancar.gov.br/avancar-web/populacomboCidade"
  QUERY = { uf: "MS" }

  steps :get_cities,
        :create_cities

  def call
    treat_exception do
      process_steps
    end
  end

  private

  def get_cities
    @cities = get(ENDPOINT, QUERY)
  end

  def create_cities
    @cities.each{ |city| City.create(name: city[:cidade]) unless already_created?(city) }
  end

  def already_created?(city)
    City.find_by(name: city[:cidade]).present?
  end
end