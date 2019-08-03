class WorksController < ApplicationController
  before_action :set_work, only: [:show]
  before_action :authenticate_user!

  def index
    @works = Work.all
  end

  def show
    @favorite = current_user.favorites.find_by(work_id: @work.id)
  end

  private
    def set_work
      @work = Work.find_by(id: params[:id])
    end

    def work_params
      params.fetch(:work, {})
    end
end
