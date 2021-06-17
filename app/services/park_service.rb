class ParkService
  def self.get_park(city, state)
    response = get_json(city, state)
    res = JSON.parse(response.body, symbolize_names: true)
    if !res[:total].nil? && res[:total].to_i > 0
      res[:data].first
    else
      nil
    end
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
