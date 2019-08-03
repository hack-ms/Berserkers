class PromoCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promo_code, only: [:show]

  def index 
    @promo_codes = PromoCode.where(required_points: 0..current_user.score).where.not(quantity: 0)  
  end

  def show
  end

  private

    def set_promo_code
      @promo_code = PromoCode.find_by(id: params[:id])
      return redirect_to promo_codes_path unless @promo_code.present?
    end


end
