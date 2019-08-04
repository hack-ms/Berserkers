class FavoritesController < ApplicationController
  before_action :set_work, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]
  before_action :authenticate_user!

  def index
  end

  def create
    favorite = current_user.favorites.create(work: @work)

    if favorite.persisted?
      flash[:notice] = "Interesse na obra criado com sucesso"
    else
      flash[:error] = "Erro ao criar interesse"
    end

    redirect_to work_path(@work)
  end

  def destroy
    if @favorite.destroy
      flash[:notice] = "Interesse na obra desfeito"
    else
      flash[:error] = "Erro ao desfazer interesse"
    end

    redirect_to work_path(@work)
  end

  private
    def set_work
      @work = Work.find_by(id: params[:work_id])
      return redirect_to works_path unless @work.present?
    end

    def set_favorite
      @favorite = current_user.favorites.find_by(work: @work)
      return redirect_to work_path(@work) unless @favorite.present?
    end
end
