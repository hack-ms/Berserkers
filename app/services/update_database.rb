class UpdateDatabase < BaseService

  steps :update_cities,
        :update_work_types,
        :update_works

  def call
    treat_exception do
      process_steps
    end
  end

  private

  def update_cities
    Populate::Cities.call
  end

  def update_work_types
    Populate::WorkTypes.call
  end

  def update_works
    Populate::Works.call
  end

end