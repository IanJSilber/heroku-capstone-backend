class AssetsController < ApplicationController
  
  def index
    assets = Asset.where(watchlist_id: params[:watchlist_id])
    i = 0
    while i < assets.length
      request = HTTP.get("https://api2.binance.com/api/v3/ticker/price?symbol=#{assets[i].name}USDT")
      request = request.parse(:json)
      assets[i].price = request["price"].to_f.round(2)
      i += 1
    end
    render json: assets
  end

  def show
    asset = Asset.find_by(watchlist_id: params[:watchlist_id], id: params[:id])

    request = HTTP.get("https://api2.binance.com/api/v3/ticker/price?symbol=#{asset.name}USDT")
    request = request.parse(:json)

    asset.price = request["price"].to_f.round(2)

    render json: asset
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
