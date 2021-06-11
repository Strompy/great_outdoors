require 'rails_helper'

RSpec.describe 'Get Park by Search Endpoint' do
  it 'can receive a location and return park data' do
    location = 'denver,co'
    get "/api/v1/parks?location=#{location}"

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:name)
    expect(data).to have_key(:description)
    expect(data).to have_key(:activites)
    expect(data).to have_key(:directions)

    expect(data[:name]).to_not be_empty
    expect(data[:description]).to_not be_empty
    expect(data[:activites]).to_not be_empty
    expect(data[:directions]).to_not be_empty
  end
  # parks search will create a search record
  # parks endpoint returns all previous searches
  # parks/:id returns individual previous search
end
