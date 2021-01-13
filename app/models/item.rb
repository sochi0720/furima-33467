class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }, numericality: { only_integer: true,greater_than: 299, less_than: 10_000_000 } do
    validates :price
  end
                                                                                            

  validates :name, presence: true
  validates :description, presence: true 
  validates :image, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_state_id
    validates :shipping_cost_id
    validates :prefecture_id 
    validates :shipping_day_id
  end
end
