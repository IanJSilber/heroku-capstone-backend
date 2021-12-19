require_relative "../../.api_keys.rb"

class AssetsController < ApplicationController

  def index
    assets = Asset.where(watchlist_id: params[:watchlist_id])

    assets_array = []
    i = 0
    while i < assets.length
      symbol = assets[i].name
      request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=#{$cmc_api_key}&symbol=#{symbol}")
      request = request.parse(:json)
      temp = { name: "", symbol: "", price: 0, percent_change_1hr: 0, percent_change_24hr: 0, percent_change_7d: 0, percent_change_30d: 0, }
      temp["symbol"] = request["data"][symbol]["symbol"]
      temp["name"] = request["data"][symbol]["name"]
      temp["price"] = '%.2f' % request["data"][symbol]["quote"]["USD"]["price"]
      temp["percent_change_1hr"] = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_1h"]
      temp["percent_change_24hr"] = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_24h"]
      temp["percent_change_7d"] = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_7d"]
      temp["percent_change_30d"] = '%.2f' % request["data"][symbol]["quote"]["USD"]["percent_change_30d"]
      i += 1
      assets_array << temp
    end
    render json: assets_array
  end

  def create
    asset = Asset.new(
      watchlist_id: params[:watchlist_id],
      name: params[:name],
    )
    if asset.save
      render json: asset
    else
      render json: {errors: asset.errors.full_messages}, status: :unproccessable_entity
    end
  end

  def destroy
    asset = asset.find_by(id: params[:id])
    asset.destroy
    render json: {message: "asset successfully destroyed"}
  end

end
