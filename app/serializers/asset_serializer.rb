class AssetSerializer < ActiveModel::Serializer
  belongs_to :watchlist
  
  # all the attributes to be rendered in json
  attributes :id, :symbol, :price, :percent_change_1h, :percent_change_24h, :percent_change_7d, :percent_change_30d, :watchlist
end
