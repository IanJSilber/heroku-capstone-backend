class Position < ApplicationRecord
  belongs_to :user
  validates :asset, :amount, :user_id, presence: true
end
