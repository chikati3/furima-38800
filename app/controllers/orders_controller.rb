class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_exhibition_product, only: [:index, :create]
  

  def index
    @address_sold = AddressSold.new
    @sold_outs = SoldOut.all
    top_page
  end
  
  def create
    @address_sold = AddressSold.new(address_params)
    if @address_sold.valid?
      pay_item
      @address_sold.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address_sold).permit(:post_code, :delivery_area_id, :municipalities, :address, :building_name, :telephone_number, :card_num, :card_month, :card_year, :card_cvc).merge(user_id: current_user.id, exhibition_product_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @exhibition_product.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_exhibition_product
    @exhibition_product = ExhibitionProduct.find(params[:item_id])
  end

  def top_page
    if @sold_outs.pluck(:exhibition_product_id).include?(@exhibition_product.id) || current_user.id == @exhibition_product.user_id
      redirect_to root_path
    end
  end

end
