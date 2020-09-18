class NearestStation < ApplicationRecord
  belongs_to :house, optional: true
  validates :line, length: { maximum: 20}
  validates :minutes, numericality: { only_integer: true}, format: { with: /\A[0-9]\z/ }, allow_blank: true
  validates :station, length: { maximum: 20}
end
