class ApplicationController < ActionController::Base

  def matches
    render json: HTTParty.get("https://globoesporte.globo.com/placar-ge/#{params[:date]}/jogos.ghtml").parsed_response
  end

end
