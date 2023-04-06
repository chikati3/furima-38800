class SoldOut < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition_product
  has_one :shipping_address
end
