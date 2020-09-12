class House < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: :both_blank, allow_destroy: true
  validates :house_name, presence: true, length: { maximum: 30}
  validates :rent_fee, presence: true, numericality: { only_integer: true}, format: { with: /\A[0-9]\z/ }
  validates :address, presence: true, length: { maximum: 75}
  validates :age, presence: true, numericality: { only_integer: true}, format: { with: /\A[0-9]\z/ }
  def both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line].blank? and attributes[:station].blank?
      !attributes[:line].blank? and attributes[:station].blank?
    else
      attributes[:line].blank? and attributes[:station].blank?
    end
  end
end
