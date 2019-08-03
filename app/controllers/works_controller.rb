class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @works = Work.all
  end

  def show
  end

  private
    def set_work
      @work = Work.find_by(id: params[:id])
    end

    def work_params
      params.fetch(:work, {})
    end
end
