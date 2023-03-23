class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @exhibition_products = ExhibitionProduct.order(created_at: :DESC)
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

  def show
    @exhibition_product = ExhibitionProduct.find(params[:id])
  end

  private

  def product_params
    params.require(:exhibition_product).permit(:image, :product_name, :description_item, :category_id, :commodity_condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
end
