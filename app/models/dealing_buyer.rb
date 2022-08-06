class DealingBuyer
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_number,:area_id,:city,:address,:building_name,:tel_number,:dealing_id,:token

  with_options presence: true do
    validates :post_number, format:{with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel_number,format:{with:/\A[0-9]{10,11}\z/,message: "is invalid."}
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :token
  end
  
  def save
    dealing = Dealing.create(user_id:user_id,item_id:item_id)
    Buyer.create(post_number:post_number, area_id:area_id, city:city, address:address, building_name:building_name, tel_number:tel_number, dealing_id:dealing.id)
  end

end