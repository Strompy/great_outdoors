class ParkService
  def self.get_park(city, state)
    response = get_json(city, state)
    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)[:data].first
    end
    # add else for bad request
  end

  private

  def self.get_json(city, state)
    conn.get do |req|
      req.params['stateCode'] = state
      req.params['limit'] = 1
      req.params['q'] = city
    end
  end

  def self.conn
    Faraday.new(
      url: 'https://developer.nps.gov/api/v1/parks',
      params: {'api_key': "#{ENV['PARK_API_KEY']}"}
      )
  end
end
