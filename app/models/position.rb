class Position < ApplicationRecord
  belongs_to :user
  validates :symbol, :amount, :user_id, presence: true

  def position_value
    return (price.to_f * amount).round(2)
  end
  def pnl_percent
    (((price.to_f - purchase_price.to_f) / purchase_price.to_f) * 100).round(2)
  end
  def pnl_dollars
    (purchase_price.to_f * pnl_percent).round(2)
  end
  def pnl_7_days
    (price.to_f * percent_change_7d).round(2)  
  end
  def pnl_30_days
    (price.to_f * percent_change_30d).round(2)  
  end
end
