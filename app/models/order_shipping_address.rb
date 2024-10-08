class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Enter it as 09012345678' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select Prefecture' }

  def save
    order = Order.create(user_id:, item_id:)

    ShippingAddress.create(
      postal_code:, prefecture_id:, city:,
      addresses:, building:, phone_number:,
      order_id: order.id
    )
  end
end
