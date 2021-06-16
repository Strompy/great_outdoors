require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :directions }
    it { should validate_presence_of :image_url }
  end
  describe 'relationships' do
    it { should have_many :park_searches }
    it { should have_many(:searches).through(:park_searches) }
  end
end

# park_data = {:id=>"67A56B17-F533-4A56-B2DA-26091C6AD295",
#  :url=>"https://www.nps.gov/romo/index.htm",
#  :fullName=>"Rocky Mountain National Park",
#  :parkCode=>"romo",
#  :description=>
#   "Rocky Mountain National Park’s 415 square miles encompass and protect spectacular mountain environments. Enjoy Trail Ridge Road – which crests at over 12,000 feet including many overlooks to experience the subalpine and alpine worlds – along with over 300 miles of hiking trails, wildflowers, wildlife, starry nights, and fun times. In a world of superlatives, Rocky is on top!",
#  :latitude=>"40.3556924",
#  :longitude=>"-105.6972879",
#  :latLong=>"lat:40.3556924, long:-105.6972879",
#  :activities=>
#   [{:id=>"09DF0950-D319-4557-A57E-04CD2F63FF42", :name=>"Arts and Culture"},
#    {:id=>"5F723BAD-7359-48FC-98FA-631592256E35", :name=>"Auto and ATV"},
#    {:id=>"0B4A5320-216D-451A-9990-626E1D5ACE28", :name=>"Scenic Driving"},
#    {:id=>"13A57703-BB1A-41A2-94B8-53B692EB7238", :name=>"Astronomy"},
#    {:id=>"A59947B7-3376-49B4-AD02-C0423E08C5F7", :name=>"Camping"},
#    {:id=>"43800AD1-D439-40F3-AAB3-9FB651FE45BB", :name=>"Gift Shop and Souvenirs"}],
#  :topics=>
#   [{:id=>"69693007-2DF2-4EDE-BB3B-A25EBA72BDF5", :name=>"Architecture and Building"},
#    {:id=>"00F3C3F9-2D67-4802-81AE-CCEA5D3BA370", :name=>"Arts"},
#    {:id=>"B85866E2-0897-4000-9040-605CA335804F", :name=>"Wilderness"}],
#  :states=>"CO",
#  :contacts=>
#   {:phoneNumbers=>[{:phoneNumber=>"9705861206", :description=>"", :extension=>"", :type=>"Voice"}, {:phoneNumber=>"9705861319", :description=>"", :extension=>"", :type=>"TTY"}], :emailAddresses=>[{:description=>"", :emailAddress=>"romo_information@nps.gov"}]},
#  :entranceFees=>
#   [{:cost=>"25.00", :description=>"Valid for date of purchase. Covers single, non-commercial vehicle with capacity of less than 16 passengers.", :title=>"1-Day Pass - Automobile"},
#    {:cost=>"15.00", :description=>"Valid for date of purchase. Applies to walk-ins, bicycles, and non-commercial groups.", :title=>"1-Day Pass - Per Person"},
#    {:cost=>"25.00", :description=>"Valid for date of purchase. Covers one motorcycle.", :title=>"1-Day Pass - Motorcycle"},
#    {:cost=>"0.00",
#     :description=>
#      "From May 28 through October 11, 2021, visitors to Rocky Mountain National Park will need a timed entry permit and an entrance pass to recreate in the park. There are 2 reservation options. Bear Lake Road Corridor from 5AM-6PM which includes Rest of Park and, Rest of Park Area (Rest of park and Rest of Park Area includes Wild Basin, Long's Peak, Trail Ridge Road, Fall River Area) that has reservations from 9AM-3PM. Outside those times no reservations needed. Permit = $0, but $2 processing fee applies.",
#     :title=>"Timed Entry Permit System"}],
#  :entrancePasses=>[{:cost=>"70.00", :description=>"Unlimited entry for one year from date of purchase. <a href=\"https://www.pay.gov/public/form/start/40243691/\">Purchase online</a>.", :title=>"Rocky Mountain National Park Annual Pass"}],
#  :fees=>[],
#  :directionsInfo=>
#   "Driving from the east: from I-25, take US Hwy 34 or 36. Driving from the west: from I-70, take US Hwy 40 to Granby to US Hwy 34 to Grand Lake. From mid-October until late May, Trail Ridge Road between Estes Park and Grand Lake is closed to vehicles, so driving between the two takes ~4 hours. The closest airport is Denver International (DIA). There is no public transportation between nearby cities and the park.",
#  :directionsUrl=>"http://www.nps.gov/romo/planyourvisit/directions.htm",
#  :operatingHours=>
#   [{:exceptions=>[],
#     :description=>"While certain roads and facilities may be closed, the park is open 24 hours a day, 365 days a year.",
#     :standardHours=>{:wednesday=>"All Day", :monday=>"All Day", :thursday=>"All Day", :sunday=>"All Day", :tuesday=>"All Day", :friday=>"All Day", :saturday=>"All Day"},
#     :name=>"Rocky Mountain National Park"}],
#  :addresses=>
#   [{:postalCode=>"80517", :city=>"Estes Park", :stateCode=>"CO", :line1=>"1000 US Hwy 36", :type=>"Physical", :line3=>"", :line2=>""}, {:postalCode=>"80517", :city=>"Estes Park", :stateCode=>"CO", :line1=>"1000 US Hwy 36", :type=>"Mailing", :line3=>"", :line2=>""}],
#  :images=>
#   [{:credit=>"NPS Photo / Ann Schonlau",
#     :title=>"Summer on the Tundra",
#     :altText=>"Yellow flowers bloom on tundra slopes with mountains in the background.",
#     :caption=>"Old Man of the Mountain bloom on Rocky's alpine tundra.",
#     :url=>"https://www.nps.gov/common/uploads/structured_data/3C7ECCCF-1DD8-B71B-0B4CB4FB1834BC1D.jpg"},
#    {:credit=>"NPS Photo",
#     :title=>"Longs Peak",
#     :altText=>"Longs Peak, covered in snow, against dark moody clouds.",
#     :caption=>"Longs Peak towers above Rocky Mountain National Park.",
#     :url=>"https://www.nps.gov/common/uploads/structured_data/3C7ECB23-1DD8-B71B-0BC28A0330D6D8D6.png"}],
#  :weatherInfo=>
#   "Winter (Dec–Mar): cold weather, deep snow at higher elevations, and seasonal closures of facilities and roads. Spring (April–May): unpredictable weather, with a mix of warm sunny days and cool days with heavy snow and rain. Many trails are still snow-covered. Trail Ridge Road opens in late May. Summer (Jun–Aug): warmer weather, thunderstorms, and wildflowers. Most park roads and facilities are open. Fall (Sep–Nov): crisp air, blue skies, fall colors, and the elk rut. Trail Ridge Road closes mid-October.",
#  :name=>"Rocky Mountain",
#  :designation=>"National Park"}
