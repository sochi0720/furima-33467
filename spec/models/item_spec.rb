require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '必要な情報を適切に入力すれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '商品名が空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報がが空では出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が空では出品できないこと' do
        @item.item_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end

      it '配送料についての情報が空では出品できないこと' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '配送元の地域についての情報が空では出品できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数についての情報が空では出品できないこと' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格についての情報が空では出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字でなければ出品できないこと' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end

      it '販売価格が299円以下では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than 299')
      end

      it '販売価格が10000000以上では出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than 10000000')
      end

      it 'カテゴリーの情報で1が選択された状態では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報で1が選択された状態では出品できないこと' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 1")
      end

      it '配送料についての情報で1が選択された状態では出品できないこと' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end

      it '配送元の地域についての情報で1が選択された状態では出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数についての情報で1が選択された状態では出品できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
    end
  end
end
