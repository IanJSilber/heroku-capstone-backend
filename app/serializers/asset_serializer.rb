class AssetSerializer < ActiveModel::Serializer
  belongs_to :watchlist
  
  attributes :id, :name, :price, :percent_change, :watchlist
end
