class Asset < ApplicationRecord
  belongs_to :watchlist
  validates :symbol, uniqueness: true
  before_validation :uppercase_symbol # before allowing request call the uppercase_symbol method below

  def uppercase_symbol
    symbol.upcase! # makes sure symbols are capitalized for API calls
  end
end
