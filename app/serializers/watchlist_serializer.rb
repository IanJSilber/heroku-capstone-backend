class WatchlistSerializer < ActiveModel::Serializer
  has_many :assets
  belongs_to :user

  # all the attributes to be rendered in json
  attributes :id, :name, :assets, :user_id, :user
end
