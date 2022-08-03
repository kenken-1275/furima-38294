class ItemsController < ApplicationController

  before_action :move_to_index,only:[:new]

  def index
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
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:item_name,:explanation,:price,:category_id,:condition_id,:postage_id,:area_id,:arrival_time_id,:image).merge(user_id:current_user.id)
  end

end
