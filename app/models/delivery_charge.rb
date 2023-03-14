class Delivery_charge < ActiveHash::Base
  self.data = [
    {id: 1, load: '---'},
    {id: 2, load: '着払い(購入者負担)'},
    {id: 3, load: '送料込み(出品者負担)'},
  ]

include ActiveHash::Associations
has_many :articles

end