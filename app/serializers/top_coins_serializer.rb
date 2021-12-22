class TopCoinsSerializer < ActiveModel::Serializer
  attributes :id, :rank, :name, :symbol, :price, :percent_change_24h, :percent_change_7d, :percent_change_30d
end
