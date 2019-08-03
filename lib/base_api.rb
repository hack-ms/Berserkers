module BaseApi

  def get(endpoint, query = nil)
    response = HTTParty.get(endpoint, query: query)
    parse_response(response)
  end

  def parse_response(response)
    response.parsed_response.map{ |object| object.deep_symbolize_keys }
  end

end