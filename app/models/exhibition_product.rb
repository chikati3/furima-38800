class ExhibitionProduct < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :commodity_condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :product_name, presence: true
  validates :description_item, presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :commodity_condition_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_area_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, numericality:  { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
end
