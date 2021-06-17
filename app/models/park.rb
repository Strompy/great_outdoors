class Park < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :directions, presence: true
  validates :image_url, presence: true

  has_many :park_searches
  has_many :searches, through: :park_searches

  scope :order_by_desc, -> { order(created_at: :desc) }
  scope :order_by_alpha_asc, -> { order(:name) }
  scope :order_by_alpha_desc, -> { order(name: :desc) }
  scope :filter_name, -> (filter) { where("lower(name) LIKE ?", "%#{filter.downcase}%") }
end
