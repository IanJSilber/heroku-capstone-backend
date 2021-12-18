require_relative "../../.api_keys.rb"

class TopCoinsController < ApplicationController
  def index
    request = HTTP.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{$cmc_api_key}")
    request = request.parse(:json)
    i = 0
    top_15 = []
    while i < 15
      temp = { rank: "", name: "", symbol: "", price: 0, percent_change_24hr: 0, percent_change_7d: 0, percent_change_30d: 0, }
      temp["rank"] = request["data"][i]["cmc_rank"]
      temp["name"] = request["data"][i]["name"]
      temp["symbol"] = request["data"][i]["symbol"]
      temp["price"] = '%.2f' % request["data"][i]["quote"]["USD"]["price"]
      temp["percent_change_24hr"] = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_24h"]
      temp["percent_change_7d"] = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_7d"]
      temp["percent_change_30d"] = '%.2f' % request["data"][i]["quote"]["USD"]["percent_change_30d"]
      top_15 << temp
      i += 1
    end
    render json: top_15
  end
end
