class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :user_item
  has_one_attached :image
  belongs_to_active_hash :category 
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  
  
  with_options presence: true do
  validates :name
  validates :introduce
  validates :category_id
  validates :item_condition_id
  validates :postage_payer_id
  validates :prefecture_id
  validates :preparation_day_id
  validates :image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  
end
