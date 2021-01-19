require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '配送先の情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_destination = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_destination).to be_valid
      end

      it 'building_nameは空でも購入できること' do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end

    context '購入できないとき' do
      it 'post_codeが空だと購入できないこと' do
        @order_destination.post_code = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと購入できないこと' do
        @order_destination.city = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @order_destination.address = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @order_destination.phone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角のハイフンを含んでいない正しい形式でないと購入できないこと' do
        @order_destination.phone_number = '025-234-567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Don't include hyphen(-)")
      end

      it 'tokenが空では購入できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では購入できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
