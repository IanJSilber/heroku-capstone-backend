class Asset < ApplicationRecord
  belongs_to :watchlist
  validates :symbol, uniqueness: true
  before_validation :uppercase_symbol

  def uppercase_symbol
    symbol.upcase!
  end
end
