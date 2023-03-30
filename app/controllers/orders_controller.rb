class OrdersController < ApplicationController

  def index
    @exhibition_product = ExhibitionProduct.find(params[:item_id])
  end
end
