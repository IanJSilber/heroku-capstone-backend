class PositionSerializer < ActiveModel::Serializer
  attributes :id, :asset, :amount, :price, :get_price
end
