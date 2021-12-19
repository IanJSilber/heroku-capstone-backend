class WatchlistSerializer < ActiveModel::Serializer
  has_many :assets
  belongs_to :user
  
  attributes :id, :name, :assets, :user_id, :user
end
