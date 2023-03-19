require 'rails_helper'

RSpec.describe ExhibitionProduct, type: :model do
  before do
    @exhibition_product = FactoryBot.build(:exhibition_product)
  end


  describe '出品登録' do
    context '登録できる場合' do
      it "出品できる" do
        expect(@exhibition_product).to be_valid
      end
    end

    context '出品できない場合' do
      it "画像が空では登録できない" do
        @exhibition_product.image = nil
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できない" do
        @exhibition_product.product_name = nil
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品説明が空では登録できない" do
        @exhibition_product.description_item = nil
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Description item can't be blank")
      end
      it "カテゴリー、未選択では登録できない" do
        @exhibition_product.category_id = 1
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Category can't be blank")
      end
      it "商品状態、未選択では登録できない" do
        @exhibition_product.commodity_condition_id = 1
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Commodity condition can't be blank")
      end
      it "配送料負担、未選択では登録できない" do
        @exhibition_product.delivery_charge_id = 1
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "発送元の地域、未選択では登録できない" do
        @exhibition_product.delivery_area_id = 1
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "発送日数、未選択では登録できない" do
        @exhibition_product.delivery_day_id = 1
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "価格が空では登録できない" do
        @exhibition_product.price = nil
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Price is not a number")
      end
      it "価格が300未満でないと登録できない" do
        @exhibition_product.price = 299
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9_999_999より大きいと登録できない" do
        @exhibition_product.price = 10_000_000
        @exhibition_product.valid?
        expect(@exhibition_product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end
