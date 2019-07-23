class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    game = Game.find(data["id"])
    if(data["points"])
    game.update!(points: data["points"])
  end
    if(data["opponentsPoints"])
    game.update!(opponentsPoints: data["opponentsPoints"])
  end
    ActionCable.server.broadcast('game', data)
  end
end
