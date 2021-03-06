class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "Input correctly"}
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :house_number
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid."}
  validates :token
  validates :item_id
  validates :user_id
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    PurchaseRecord.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
end