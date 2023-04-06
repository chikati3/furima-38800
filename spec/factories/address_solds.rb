FactoryBot.define do
  factory :address_sold do
    post_code           {'100-1000'}
    delivery_area_id    {2}
    municipalities      {'横浜'}
    address             {'1-2'}
    building_name       {'ビル'}
    telephone_number    {'09098765432'}
    token               {"tok_abcdefghijk00000000000000000"}

  end
end
