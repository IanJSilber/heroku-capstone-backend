class PositionSerializer < ActiveModel::Serializer
  attributes :id, :asset, :amount, :price, :position_value
end
