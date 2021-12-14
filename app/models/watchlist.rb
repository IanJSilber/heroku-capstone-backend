class Watchlist < ApplicationRecord
  has_many :assets
  belongs_to :user
end
