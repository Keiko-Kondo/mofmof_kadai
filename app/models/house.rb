class House < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: :reject_stations, allow_destroy: true
  validates :house_name, presence: true, length: { maximum: 30}
  validates :rent_fee, presence: true
  validates :address, presence: true, length: { maximum: 75}
  validates :age, presence: true

  private
  def reject_stations(attributes)
    attributes[:line].blank? || attributes[:station].blank?
  end
end
