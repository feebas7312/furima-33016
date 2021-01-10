require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では保存できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'sales_status_idが空では保存できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status Select')
      end
      it 'shipping_fee_status_idが空では保存できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status Select')
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'scheduled_delivery_idが空では保存できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      end
      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では保存できない' do
        @item.price = @item.price.to_s.tr('0-9', '０-９')
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが¥300以下だと保存できない' do
        @item.price = Faker::Number.between(from: 1, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥9,999,999以上だと保存できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
