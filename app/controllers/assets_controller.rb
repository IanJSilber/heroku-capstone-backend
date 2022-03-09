require_relative "../../.api_keys.rb"

class AssetsController < ApplicationController

  def index
    assets = Asset.where(user_id: current_user.id) # select the assets based on user

    assets.each do |asset|
      symbol = asset.symbol # get the symbol
      request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_keys.sample}&symbol=#{symbol}")
      request = request.parse(:json) # make the request using the symbol
      asset.name = request["data"][symbol]["name"]
      asset.price = '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
      asset.percent_change_1h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_1h"]
      asset.percent_change_24h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_24h"]
      asset.percent_change_7d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_7d"]
      asset.percent_change_30d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_30d"]
      # get the required data from the request
    end
    render json: assets
  end

  def create
    asset = Asset.new(
      user_id: current_user.id,
      symbol: params[:symbol],
    )
    if asset.save
      render json: asset
    else
      render json: {errors: asset.errors.full_messages}, status: :unproccessable_entity
    end
  end

  def destroy
    asset = Asset.find_by(id: params[:id])
    asset.destroy
    render json: {message: "asset successfully destroyed"}
  end

end
