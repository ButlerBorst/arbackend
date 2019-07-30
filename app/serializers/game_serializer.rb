class GameSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id
  # this needs to have has_many :users
  # the only attribute is id
end
