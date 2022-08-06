class DealingsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @dealing_buyer = DealingBuyer.new
  end

  def create
    @dealing_buyer = DealingBuyer.new(dealing_params)
    if @dealing_buyer.valid?
      @dealing_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def dealing_params
    params.require(:dealing_buyer).permit(:post_number,:tel_number,:city,:address,:building_name,:area_id,).merge(item_id:params[:item_id],user_id:current_user.id)
  end

end
