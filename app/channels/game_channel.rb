class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)

    # we get something from the frontend saying b just scored a point
    # currently, data looks like:
    # data: {
    #   id: 1,
    #   points: 5,
    #   opponentsPoints: 3
    # }

    # in the new schema, it needs to know who the two players are

    # one option is to update one player at a  time.  then data will look like
    # data: {
    #   user_id:  100,
    #   points: 5
    # }

    # user = User.find(data["user_id"])
    # user.update!(points: data["points"])

    # other option is to send a list of players and their new point totals
    # data: {
    #   users: [
    #     {
    #       id:100,
    #       points: 5
    #     },
    #     {
    #       id: 105,
    #       points: 3
    #     }
    #   ]
    # }

    # user_jsons = data["users"]
    # user_jsons.each do |user_json|
    #   user = User.find(user_json["id"])
    #   user.update!(points:user_json["points"])
    # end

    user = User.find(data["user_id"])
    if(data["points"])
    user.update!(points: data["points"])
  end

    ActionCable.server.broadcast('game', data)
  end
end
