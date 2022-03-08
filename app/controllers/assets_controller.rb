require_relative "../../.api_keys.rb"

class AssetsController < ApplicationController

  def index
    assets = Asset.where(watchlist_id: params[:watchlist_id]) # select the assets based on watchlist

    i = 0
    while i < assets.length
      symbol = assets[i].symbol # get the symbol
      request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_keys.sample}&symbol=#{symbol}")
      request = request.parse(:json) # make the request using the symbol
      assets[i].name = request["data"][symbol]["name"]
      assets[i].price = '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
      assets[i].percent_change_1h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_1h"]
      assets[i].percent_change_24h = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_24h"]
      assets[i].percent_change_7d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_7d"]
      assets[i].percent_change_30d = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_30d"]
      # get the required data from the request
      i += 1
    end
    render json: assets
  end

  def create
    asset = Asset.new(
      watchlist_id: params[:watchlist_id],
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
