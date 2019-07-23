class GameSerializer < ActiveModel::Serializer
  attributes :id, :points, :win, :loss, :rank, :opponentsPoints
end
