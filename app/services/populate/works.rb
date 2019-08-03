class Populate::Works < BaseService
  include BaseApi

  ENDPOINT = "https://avancar.gov.br/avancar-web/empreendimentos"
  WORK_BASE_URL = "https://avancar.gov.br/avancar-web/empreendimentos"
  QUERY = { json: true, uf: "MS" }

  steps :create_works,
        :update_work_type,
        :add_investment_and_image

  def call
    treat_exception do
      process_steps
    end
  end

  private

  def create_works
    City.all.each do |city|
      city.works.create(get_works_from_city(city))
    end
  end

  def update_work_type
    WorkType.all.each do |work_type|
      update_works(get_works_from_work_type(work_type), work_type)
    end
  end

  def add_investment_and_image
    Work.all.each do |work|
      update_work(work, parsed_page(work))
    end
  end

  def get_works_from_city(city)
    get(ENDPOINT, QUERY.merge({ municipio: city.name }))
  end

  def get_works_from_work_type(work_type)
    get(ENDPOINT, QUERY.merge({ tipo: work_type.name }))
  end

  def update_works(requested_works, work_type)
    Work.where(idn_empreendimento: requested_works.pluck(:idn_empreendimento)).update(work_type: get_work_type_from_name(work_type.name))
  end

  def get_work_type_from_name(name)
    WorkType.find_by(name: name)
  end

  def update_work(work, parsed_page)
    work.update(investment: parsed_page.css('b')[6].text,
                orgao_responsavel: parsed_page.css('b')[4].text,
                executor: parsed_page.css('b')[5].text,
                image_url: parsed_page.css('img').pluck(:src).select{ |src| src.include?('img') }.first )
  end

  def parsed_page(work)
    Nokogiri::HTML.parse(HTTParty.get("#{WORK_BASE_URL}/#{work.idn_empreendimento}/visualizar").parsed_response)
  end
end