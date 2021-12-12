class Position < ApplicationRecord
  belongs_to :user
  validates :asset, :amount, :user_id, presence: true

  def position_value
    return price.to_f * amount
  end
end
