require_relative "../../.news_api_key.rb"

class NewsController < ApplicationController
  def index
    request = HTTP.get("https://newsapi.org/v2/top-headlines?category=business&q=cryptocurrency&apiKey=#{$api_key}")
    request = request.parse(:json)
    render json: request
  end
end
