class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end