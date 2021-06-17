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
  it 'can reverse order search results' do
    park1 = Park.create(
      name: "Rocky Mountain National Park",
      description: "Rocky Mountain National Park’s 415 square miles encompass and protect spectacular mountain environments.",
      directions: "Driving from the east: from I-25, take US Hwy 34 or 36.",
      image_url: "image.com"
    )
    park2 = Park.create(
      name: "African American Civil War Memorial",
      description: "Over 200,000 African-American soldiers and sailors served in the U.S. Army",
      directions: "The memorial is located at the corner of Vermont Avenue",
      image_url: "image.com"
    )
    park3 = Park.create(
      name: "Klondike Gold Rush - Seattle Unit National Historical Park",
      description: "Seattle flourished during and after the Klondike Gold Rush",
      directions: "The park and visitor center are located on the northwest corner of 2nd Ave South",
      image_url: "image.com"
    )
    park1.searches << Search.create(location: 'denver,co')
    park2.searches << Search.create(location: 'washington,dc')
    park3.searches << Search.create(location: 'seattle,wa')


    get "/api/v1/parks?order=desc"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[0][:id].to_i).to eq(park3.id)
    expect(data[1][:id].to_i).to eq(park2.id)
    expect(data[2][:id].to_i).to eq(park1.id)
  end
  it 'can order search results by name' do
    park1 = Park.create(
      name: "Rocky Mountain National Park",
      description: "Rocky Mountain National Park’s 415 square miles encompass and protect spectacular mountain environments.",
      directions: "Driving from the east: from I-25, take US Hwy 34 or 36.",
      image_url: "image.com"
    )
    park2 = Park.create(
      name: "African American Civil War Memorial",
      description: "Over 200,000 African-American soldiers and sailors served in the U.S. Army",
      directions: "The memorial is located at the corner of Vermont Avenue",
      image_url: "image.com"
    )
    park3 = Park.create(
      name: "Klondike Gold Rush - Seattle Unit National Historical Park",
      description: "Seattle flourished during and after the Klondike Gold Rush",
      directions: "The park and visitor center are located on the northwest corner of 2nd Ave South",
      image_url: "image.com"
    )
    park1.searches << Search.create(location: 'denver,co')
    park2.searches << Search.create(location: 'washington,dc')
    park3.searches << Search.create(location: 'seattle,wa')


    get "/api/v1/parks?order=alpha_asc"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[0][:id].to_i).to eq(park2.id)
    expect(data[1][:id].to_i).to eq(park3.id)
    expect(data[2][:id].to_i).to eq(park1.id)

    # get "/api/v1/parks?order=alpha_desc"
    #
    # expect(response).to be_successful
    # data = JSON.parse(response.body, symbolize_names: true)[:data]
    #
    # expect(data[0][:id].to_i).to eq(park1.id)
    # expect(data[1][:id].to_i).to eq(park3.id)
    # expect(data[2][:id].to_i).to eq(park2.id)
  end
  # parks/:id returns individual previous search
end
