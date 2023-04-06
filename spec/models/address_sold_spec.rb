require 'rails_helper'

RSpec.describe AddressSold, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @exhibition_product = FactoryBot.create(:exhibition_product)
    @address_sold = FactoryBot.build(:address_sold, exhibition_product_id: @exhibition_product.id, user_id: @user.id)
    sleep 0.1
  end

  context '購入できる' do
    it "必須項目に入力して購入できる" do
      expect(@address_sold).to be_valid
    end
    it "建物名がなくても購入できる" do
      expect(@address_sold).to be_valid
    end
  end

  context '購入できない' do
    it "tokenが空では購入できない" do
      @address_sold.token = nil
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空では購入できない" do
      @address_sold.post_code = nil
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "郵便番号が(３桁ハイフン４桁)の半角英数字でないと購入できない" do
      @address_sold.post_code = '１２３−１２３４'
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "都道府県を選択していないと購入できない" do
      @address_sold.delivery_area_id = 1
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Delivery area can't be blank")
    end
    it "市区町村を入力していないと購入できない" do
      @address_sold.municipalities = ''
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Municipalities can't be blank")
    end
    it "番地を入力していないと購入できない" do
      @address_sold.address = ''
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号を入力していないと購入できない" do
      @address_sold.telephone_number = ''
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Telephone number can't be blank")
    end
    it "電話番号が９桁以下だと購入できない" do
      @address_sold.telephone_number = ''
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Telephone number is not")
    end
    it "電話番号が12桁以上だと購入できない" do
      @address_sold.telephone_number = ''
      @address_sold.valid?
      expect(@address_sold.errors.full_messages).to include("Telephone number is not")
    end
  end
end
