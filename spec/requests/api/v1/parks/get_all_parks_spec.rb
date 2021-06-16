require 'rails_helper'

RSpec.describe 'Get all parks by parks Endpoint' do
  it 'can receive a location and return park data' do
    get "/api/v1/parks?location=denver,co"
    get "/api/v1/parks?location=washington,dc"
    get "/api/v1/parks?location=seattle,wa"

    expect(Search.count).to eq(3)
    expect(Park.count).to eq(3)

    get '/api/v1/parks'

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data.size).to eq(3)

    data.each do |park|
      expect(park[:type]).to eq('park')
      expect(park[:attributes].keys).to include(:name)
      expect(park[:attributes].keys).to include(:description)
      expect(park[:attributes].keys).to include(:directions)
      expect(park[:attributes].keys).to include(:image_url)
    end
  end
end
