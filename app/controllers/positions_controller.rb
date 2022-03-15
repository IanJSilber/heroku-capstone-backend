class PositionsController < ApplicationController

  before_action :authenticate_user
  # INDEX ROUTE
  def index
    positions = Position.where(user_id: current_user) # positions = positions that belong to the current user

    positions.each do |position| # go through each position and update price and percent changes
      symbol = position.symbol  
      # ^ for use in cmc_api call // https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=bf3842fe-3658-477c-97cf-b64d82a50e2f&symbol=BTC
      # return all cryptocurrencies: https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=bf3842fe-3658-477c-97cf-b64d82a50e2f
      request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{ENV["cmc_api_keys"].split(",").sample}&symbol=#{symbol}")
      request = request.parse(:json)
      # ^make a request to cmc api using the symbol of the current position and parse into json format
      position.price = '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
      position.percent_change_1h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_1h"]
      position.percent_change_24h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_24h"]
      position.percent_change_7d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_7d"]
      position.percent_change_30d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_30d"]
      # various value reassignments 
    end
    render json: positions # render as json using the positions serializer found at ./serializers/position_serializer.rb
  end

  # SHOW ROUTE
  def show
    position = Position.find_by(user_id: current_user.id, id: params[:id]) # find a specific position belonging to current user and search by id
    symbol = position.symbol
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{ENV["cmc_api_keys"].split(",").sample}&symbol=#{symbol}")
    request = request.parse(:json)

    position.price = '%.2f' % (request["data"][symbol]["quote"]["USD"]["price"].to_i) # update price

    render json: position
  end

  # CREATE ROUTE
  def create
    symbol = params[:symbol]
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{ENV["cmc_api_keys"].split(",").sample}&symbol=#{symbol}")
    request = request.parse(:json)
    position = Position.new(
      user_id: current_user.id,
      symbol: params[:symbol], # get symbol via user input
      amount: params[:amount], # get amount via user input
      purchase_price: '%.2f' % request["data"][symbol]["quote"]["USD"]["price"] # get price via user inputed symbol
    )

    if position.save
      render json: position
    else # error handling, provides messages and code
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  # UPDATE ROUTE
  def update
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id # Ensure the user has permission to update the selected position
      position.amount = params[:amount] || position.amount # Users can only change the amount of their position
    end
    if position.save
      render json: position
    else # error handling
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  # DESTROY ROUTE
  def destroy
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id # Ensure the user has permission to delete the selected position
      position.destroy
      render json: {message: "Position successfully destroyed"}
    else
      render json: { errors: position.errors.full_messages }, status: 422 # if not, throw error
    end
  end

end
