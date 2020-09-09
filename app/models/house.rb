class House < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true
  validates :house_name, presence: true
  validates :rent_fee, presence: true
  validates :address, presence: true
  validates :age, presence: true
end
