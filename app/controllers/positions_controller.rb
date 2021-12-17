class PositionsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  def index
    positions = current_user.positions
    i = 0
    while i < positions.length
      request = HTTP.get("https://api2.binance.com/api/v3/ticker/24hr?symbol=#{positions[i].asset}USDT")
      request = request.parse(:json)
      positions[i].percent_change = request["priceChangePercent"]
      positions[i].price = request["lastPrice"].to_f.round(2)
      i += 1
    end
    render json: positions
  end

  def show
    position = Position.find_by(user_id: current_user.id, id: params[:id])

    request = HTTP.get("https://api2.binance.com/api/v3/ticker/price?symbol=#{position.asset}USDT")
    request = request.parse(:json)

    position.price = request["price"].to_f.round(2)

    render json: position
  end

  def create
    position = Position.new(
      user_id: current_user.id,
      asset: params[:asset],
      amount: params[:amount],
    )
    if position.save
      render json: position
    else
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def update
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id
      position.asset = params[:asset] || position.asset
      position.amount = params[:amount] || position.amount
    end
    if position.save
      render json: position
    else
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def destroy
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id
      position.destroy
      render json: {message: "Position successfully destroyed"}
    else
      render json: { errors: position.errors.full_messages }, status: 422
    end
  end

end
