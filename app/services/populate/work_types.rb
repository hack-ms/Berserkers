class Populate::WorkTypes < BaseService
  include BaseApi

  ENDPOINT = "https://avancar.gov.br/avancar-web/populacomboTipo"

  steps :get_work_types,
        :create_work_types

  def call
    treat_exception do
      process_steps
    end
  end

  private

  def get_work_types
    @work_types = get(ENDPOINT)
  end

  def create_work_types
    @work_types.each{ |work_type| WorkType.create(name: work_type[:tipo]) unless already_created?(work_type) }
  end

  def already_created?(work_type)
    WorkType.find_by(name: work_type[:tipo]).present?
  end
end