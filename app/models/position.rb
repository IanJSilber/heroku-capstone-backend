class Position < ApplicationRecord
  belongs_to :user
  validates :asset, :amount, :user_id, presence: true

  def get_price
    request = HTTP.get("https://api2.binance.com/api/v3/ticker/24hr")
    request = request.parse(:json)

    i = 0
    while i < request.length
      position = Position.where(user_id: current_user.id, asset: request[i]["symbol"])
      if position
        position.price = request[i]["lastPrice"]
        position.save
      end
    end
  end

  def position_value
    return price.to_i * amount
  end

  def portfolio_value
    position = Position.where(user_id: current_user.id)
    i = 0
    sum = 0
    while i < position.length
      sum += position[i].position_value
      i += 1
    end
    return sum
  end
end
