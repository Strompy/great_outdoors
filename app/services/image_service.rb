class ImageService
  def self.get_by_name(name)
  response = get_json(name)
  parsed = JSON.parse(response.body, symbolize_names: true)
  if parsed[:total] == 0
    'https://www.nps.gov/aboutus/news/images/JOTR_NPSBradSutton_960w.jpg'
  else
    num = rand(0..parsed[:hits].size-1)
    parsed[:hits][num][:largeImageURL]
  end
end

private

def self.get_json(search)
  conn.get do |req|
    req.params['q'] = search
    req.params['orientation'] = 'horizontal'
  end
end

def self.conn
  Faraday.new('https://pixabay.com/api/') do |f|
    f.params[:key] = ENV['PIXABAY_API_KEY']
  end
end
end
