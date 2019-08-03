class Populate::Works < BaseService
  include BaseApi

  ENDPOINT = "https://avancar.gov.br/avancar-web/empreendimentos"
  QUERY = { json: true, uf: "MS" }

  steps :create_works,
        :update_work_type

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
end