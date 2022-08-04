class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :authenticate_user!, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      @item = item
      render :edit
    end
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :category_id, :condition_id, :postage_id, :area_id, :arrival_time_id,
                                 :image).merge(user_id: current_user.id)
  end
end
