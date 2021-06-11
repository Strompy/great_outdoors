class Park < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :directions, presence: true
end
