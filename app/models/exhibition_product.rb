class ExhibitionProduct < ApplicationRecord
  has_one_attached :image

  validates :product_name, presence: true
  validates :description_item, presence: true
  validates :category_id, presence: true
  validates :commodity_condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
