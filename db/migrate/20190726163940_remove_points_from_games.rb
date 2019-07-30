class RemovePointsFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :points, :integer
  end
end
