class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :password_digest, :game_id, :points, :win, :loss
    # this should have id, username, game_id, points, etc.
end
