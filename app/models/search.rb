class Search < ApplicationRecord
  validates :location, presence: true

  has_many :park_searches
  has_many :parks, through: :park_searches
end
