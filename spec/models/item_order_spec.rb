require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
    sleep(0.05)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@item_order).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @item_order.postal_code = Faker::Number.number(digits: 7)
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code Include correctly')
      end
      it 'prefecture_idが空では購入できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空では購入できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では登録できない' do
        @item_order.addresses = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @item_order.phone_number = Faker::Number.number(digits: 12)
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number Input only number')
      end
      it 'user_idが紐付いていないと購入できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていないと購入できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
