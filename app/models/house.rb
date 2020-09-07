class House < ApplicationRecord
  has_many :nearest_stations
  accepts_nested_attributes_for :nearest_stations
end
