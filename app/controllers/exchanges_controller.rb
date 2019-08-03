class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def new  
    @expense   
  end


end
