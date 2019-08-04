class ExchangesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promo_code, only: [:create]
  before_action :verify_points, only: [:create]

  def create
    exchange = current_user.exchanges.create(promo_code: @promo_code)

    if exchange.persisted?
      @promo_code.decrement_quantity!
      current_user.update(score: current_user.score - @promo_code.required_points)

      flash[:notice] = "Sucesso! Verifique no seu email o código promocional"
    else
      flash[:error] = "Ocorreu um erro ao resgatar o código"
    end

    redirect_to user_path(current_user)
  end

  private
    def set_promo_code
      @promo_code = PromoCode.find_by(id: params[:promo_code_id])
      return redirect_to user_path(current_user) unless @promo_code.present?
    end

    def verify_points
      if @promo_code.required_points > current_user.score
        flash[:error] = "Você não tem pontos suficientes para este cupom :("
        return redirect_to user_path(current_user)
      end
    end
end
