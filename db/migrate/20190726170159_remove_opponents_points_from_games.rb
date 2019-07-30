class RemoveOpponentsPointsFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :opponentsPoints, :integer
  end
end
