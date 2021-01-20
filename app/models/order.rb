class Order < ApplicationRecord
  has_one :destination
  belongs_to :user
  belongs_to :item
  has_one_attached :image
end
