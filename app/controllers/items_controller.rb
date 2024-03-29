class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_exhibition_product, only: [:edit, :show, :update, :destroy]
  before_action :same_user, only: [:edit, :update, :destroy]
  before_action :same_sold_out, only: [:index, :show]
  
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
  end

  def edit
    @sold_outs = SoldOut.all
    if @sold_outs.pluck(:exhibition_product_id).include?(@exhibition_product.id)
      redirect_to root_path
    end
  end

  def update
    if @exhibition_product.update(product_params)
      redirect_to item_path(@exhibition_product)
    else
      render :edit
    end
  end

  def destroy
    @exhibition_product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:exhibition_product).permit(:image, :product_name, :description_item, :category_id, :commodity_condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_exhibition_product
    @exhibition_product = ExhibitionProduct.find(params[:id])
  end

  def same_user
    redirect_to root_path unless @exhibition_product.user_id == current_user.id
  end

  def same_sold_out
    @sold_outs = SoldOut.all
  end
  
end
