class UserSerializer < ActiveModel::Serializer
  
  # all the attributes to be rendered in json
  attributes :id, :name
end
