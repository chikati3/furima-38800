class AddressSold
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :sold_out_id, :exhibition_product_id, :token

  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id,  numericality: { other_than: 1 , message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is not"}
    validates :exhibition_product_id
    validates :user_id
    validates :token
  end

  def save
    sold_out = SoldOut.create(exhibition_product_id: exhibition_product_id, user_id: user_id)

    ShippingAddress.create(post_code: post_code, delivery_area_id: delivery_area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, sold_out_id: sold_out.id)

  end
end