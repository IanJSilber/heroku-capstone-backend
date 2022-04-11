class Position < ApplicationRecord
  belongs_to :user
  validates :symbol, :amount, :user_id, presence: true # make sure symbol and amount is present
  validates :symbol, uniqueness: true # make sure the symbol is unique; a user doesnt already have a BTC position, etc.
  # before_validation :uppercase_symbol # make sure the symbol is capitalized

  # Uppercase symbol before creating a position
  # def uppercase_symbol
  #   symbol.upcase!
  # end

  # get total value of a position by multiplying current price * amount
  def position_value
    return (price.to_f * amount).round(2)
  end

  # get profit and loss percentage
  def pnl_percent
    (((price.to_f - purchase_price.to_f) / purchase_price.to_f) * 100).round(2)
  end

  # get total profit and loss in dollars
  def pnl_dollars
    (purchase_price.to_f * pnl_percent).round(2)
  end

  #get profit and loss in dollars over the past 7 days
  def pnl_7_days
    (purchase_price.to_f * percent_change_7d.to_f).round(2)
  end

  #get profit and loss in dollars over the past 30 days
  def pnl_30_days
    (purchase_price.to_f * percent_change_30d.to_f).round(2)
  end
end
