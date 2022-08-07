require 'rails_helper'

RSpec.describe DealingBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @dealing_buyer = FactoryBot.build(:dealing_buyer,user_id:user.id,item_id:item.id)

    sleep 0.1
  end

   describe '商品購入機能' do
    context '商品購入できる時' do
      it '全ての情報が正しく入力されていれば購入できる' do
        expect(@dealing_buyer).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @dealing_buyer.building_name = ""
        expect(@dealing_buyer).to be_valid
      end
      it 'tel_numberは11桁でも購入できる' do
        @dealing_buyer.tel_number = "12345678901"
        expect(@dealing_buyer).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'post_numberが空では購入できない' do
        @dealing_buyer.post_number = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberに-（ハイフン）が無ければ購入できない' do
        @dealing_buyer.post_number = "1234567"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'post_numberは全角では購入できない' do
        @dealing_buyer.post_number = "１２３−４５６７"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'area_idが空では購入できない' do
        @dealing_buyer.area_id = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが「---」では購入できない' do
        @dealing_buyer.area_id = 1
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では購入できない' do
        @dealing_buyer.city = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @dealing_buyer.address = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では購入できない' do
        @dealing_buyer.tel_number = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下では購入できない' do
        @dealing_buyer.tel_number = "123456789"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberが12桁以上では購入できない' do
        @dealing_buyer.tel_number = "123456789012"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberが全角数字では購入できない' do
        @dealing_buyer.tel_number = "１２３４５６７８９０"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberが漢字では購入できない' do
        @dealing_buyer.tel_number = "電話番号"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberがカタカナでは購入できない' do
        @dealing_buyer.tel_number = "デンワ"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberがひらがなでは購入できない' do
        @dealing_buyer.tel_number = "デンワ"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberが英字では購入できない' do
        @dealing_buyer.tel_number = "tel"
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tokenが無ければ購入できない' do
        @dealing_buyer.token = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づかなければ購入できない' do
        @dealing_buyer.user_id = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づかなければ購入できない' do
        @dealing_buyer.item_id = ""
        @dealing_buyer.valid?
        expect(@dealing_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
