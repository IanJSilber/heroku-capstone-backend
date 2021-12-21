require_relative "../../.api_keys.rb"
class PositionsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  def index
    positions = current_user.positions
    i = 0
    while i < positions.length
      symbol = positions[i].symbol
      request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_key}&symbol=#{symbol}")
      request = request.parse(:json)
      positions[i].symbol = request["data"][symbol]["symbol"]
      positions[i].price = '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
      positions[i].percent_change_1h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_1h"]
      positions[i].percent_change_24h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_24h"]
      positions[i].percent_change_7d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_7d"]
      positions[i].percent_change_30d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_30d"]
      i += 1
    end
    render json: positions
  end

  def show
    position = Position.find_by(user_id: current_user.id, id: params[:id])
    symbol = position.symbol
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_key}&symbol=#{symbol}")
    request = request.parse(:json)

    position.price = '%.2f' % (request["price"].to_i)

    render json: position
  end

  def create
    symbol = params[:symbol]
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_key}&symbol=#{symbol}")
    request = request.parse(:json)
    position = Position.new(
      user_id: current_user.id,
      symbol: params[:symbol],
      amount: params[:amount],
      purchase_price: '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
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
