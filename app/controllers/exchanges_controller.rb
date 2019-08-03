class ExchangesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promo_code, only: [:create]

  def create 
    exchange = current_user.exchanges.create(promo_code: @promo_code)   
    
    if exchange.persisted?
      @promo_code.decrement_quantity!
      flash[:notice] = "Sucesso! Verifique no seu email o código promocional"
    else
      flash[:error] = "Ocorreu um erro ao resgatar o código"
    end

    redirect_to user_path(current_user)
  end

  private
    def set_promo_code
      @promo_code = PromoCode.find_by(id: params[:id])
      return redirect_to user_path(current_user) unless @promo_code.present?
    end
end
