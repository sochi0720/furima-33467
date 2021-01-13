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

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }, numericality: { only_integer: true,
                                                                                                              greater_than: 299, less_than: 10_000_000 }

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_state_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :item_state_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
