require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end
  describe 'relationships' do
    it { should have_many :park_searches }
    it { should have_many(:parks).through(:park_searches) }
  end
end
