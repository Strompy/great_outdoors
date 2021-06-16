class Park < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :directions, presence: true
  validates :image_url, presence: true

  has_many :park_searches
  has_many :searches, through: :park_searches
end
