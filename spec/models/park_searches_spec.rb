require 'rails_helper'

RSpec.describe ParkSearch, type: :model do
  describe 'relationships' do
    it { should belong_to :park }
    it { should belong_to :search }
  end
end
