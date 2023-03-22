FactoryBot.define do
  factory :exhibition_product do
    association :user
    
    product_name                 {Faker::Name.initials(number: 2)}
    description_item             {Faker::Lorem.sentence}
    category_id                  {2}
    commodity_condition_id       {2}
    delivery_charge_id           {2}
    delivery_area_id             {2}
    delivery_day_id              {2}
    price                        {123456}

    after(:build) do |product_image|
      product_image.image.attach(io: File.open('public/images/hinamatsuri_hinakazari_set.png'), filename: 'hinamatsuri_hinakazari_set.png')
    end
  end
end
