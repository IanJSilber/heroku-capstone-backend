class Position < ApplicationRecord
  belongs_to :user
  validates :symbol, :amount, :user_id, presence: true
  validates :symbol, uniqueness: true
  before_validation :uppercase_symbol

  def uppercase_symbol
    symbol.upcase!
  end
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
    (purchase_price.to_f * percent_change_7d.to_f).round(2)  
  end
  def pnl_30_days
    (purchase_price.to_f * percent_change_30d.to_f).round(2)  
  end
end
