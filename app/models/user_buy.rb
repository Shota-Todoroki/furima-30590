class UserBuy
  include ActiveModel::Model 
  attr_accessor :postal_code, :region_id, :city, :address, :building_name, :phone_number, :user_id, :product_id, :token


  with_options presence: true do
    validates :city
    validates :address
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
  end

  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with:/\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
  end

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building_name: building_name, phone_number: phone_number ,buy_id: buy.id)
  end
end
