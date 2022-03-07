class PositionSerializer < ActiveModel::Serializer
  belongs_to :user
  
  # all the attributes to be rendered in json
  attributes :id, :symbol, :amount, :price, :position_value, :user, :percent_change_1h, :percent_change_24h, :percent_change_7d, :percent_change_30d,:purchase_price, :pnl_percent, :pnl_dollars, :pnl_7_days, :pnl_30_days
end
