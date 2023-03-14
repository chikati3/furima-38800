class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :commodity_condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :title, :text, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
