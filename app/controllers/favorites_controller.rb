class FavoristesController < ApplicationController
  before_action :set_work, only: [:create]
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.create(work: @work)

    if favorite.persisted?
      flash[:notice] = "Interesse na obra criado com sucesso"
    else
      flash[:error] = "Erro ao criar interesse"
    end

    redirect_to works_path
  end

  private
    def set_work
      @work = Work.find_by(id: params[:work_id])
      return redirect_to works_path unless @work.present?        
    end
end
