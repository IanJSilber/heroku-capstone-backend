class PositionSerializer < ActiveModel::Serializer
  belongs_to :user
  
  attributes :id, :asset, :amount, :price, :position_value, :user, :percent_change, :purchase_price
end
