class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # @items = Item.all
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduce, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
