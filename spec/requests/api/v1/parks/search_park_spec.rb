require 'rails_helper'

RSpec.describe 'Search Park by parks  Endpoint' do
  it 'can receive a location and return park data' do
    location = 'denver,co'
    get "/api/v1/parks?location=#{location}"

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')

    data = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(data).to have_key(:name)
    expect(data).to have_key(:description)
    expect(data).to have_key(:directions)

    expect(data[:name]).to_not be_empty
    expect(data[:description]).to_not be_empty
    expect(data[:directions]).to_not be_empty

    expect(Park.count).to eq(1)
  end
  it 'creates a new search record when searching for a new location' do
    location = 'denver,co'
    expect(Search.count).to eq(0)

    get "/api/v1/parks?location=#{location}"
    expect(response).to be_successful

    expect(Search.count).to eq(1)
    search = Search.last
    expect(search.location).to eq(location)
    expect(search.parks).to_not be_empty
  end
  it 'uses the previous search for a non-unique location' do
    location = 'denver,co'
    get "/api/v1/parks?location=#{location}"

    expect(response).to be_successful
    expect(Search.count).to eq(1)
    expect(Park.count).to eq(1)

    get "/api/v1/parks?location=#{location}"

    expect(Search.count).to eq(1)
    expect(Park.count).to eq(1)
  end
  it 'returns an image for the park' do
    location = 'denver,co'

    get "/api/v1/parks?location=#{location}"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(data).to have_key(:image_url)
    expect(data[:image_url]).to_not be_empty
  end
  # parks endpoint returns all previous searches
  # parks/:id returns individual previous search
end