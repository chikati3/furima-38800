class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
  end

  def new
    @exhibition_product = ExhibitionProduct.new
  end

  def create
    @exhibition_product = ExhibitionProduct.new(product_params)
    if @exhibition_product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:exhibition_product).permit(:image, :product_name, :description_item, :category_id, :commodity_condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
end
