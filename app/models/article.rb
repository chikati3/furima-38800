class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :commodity_condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day


end
