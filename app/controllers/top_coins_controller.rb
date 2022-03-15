class TopCoinsController < ApplicationController

  # TOP COINS INDEX - get top 15 cryptocurrencies by market cap
  def index
    top_coins = TopCoin.all
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV[cmc_api_keys].split(",").sample}")
    request = request.parse(:json)
    i = 0
    15.times do # get the 15 top coins
      top_coins[i].rank = request["data"][i]["cmc_rank"]
      top_coins[i].name = request["data"][i]["name"]
      top_coins[i].symbol = request["data"][i]["symbol"]
      top_coins[i].price = '%.2f' % request["data"][i]["quote"]["USD"]["price"]
      top_coins[i].percent_change_24h = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_24h"]
      top_coins[i].percent_change_7d = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_7d"]
      top_coins[i].percent_change_30d = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_30d"]
      # retrieve all the neccessary data and then add 1 to 'i'
      i += 1
    end

    render json: top_coins
  end

end
