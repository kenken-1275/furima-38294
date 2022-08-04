class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit,]
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    unless @item.user.id != current_user.id
    @item.delete
    redirect_to root_path
    end
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :category_id, :condition_id, :postage_id, :area_id, :arrival_time_id,
                                 :image).merge(user_id: current_user.id)
  end
end
