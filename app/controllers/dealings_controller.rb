class DealingsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!,only:[:index]

  def index
    @dealing_buyer = DealingBuyer.new
    if Dealing.exists?(item_id:@item.id) || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @dealing_buyer = DealingBuyer.new(dealing_params)
    if @dealing_buyer.valid?
      pay_item
      @dealing_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def dealing_params
    params.require(:dealing_buyer).permit(:post_number,:tel_number,:city,:address,:building_name,:area_id,).merge(item_id:params[:item_id],user_id:current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: dealing_params[:token],
      currency: 'jpy'
    )
  end

end
