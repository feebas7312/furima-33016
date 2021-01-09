class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Include correctly' }
    validates :prefecture_id, numericality: { message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
