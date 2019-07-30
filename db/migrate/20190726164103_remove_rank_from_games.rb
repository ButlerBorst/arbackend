class RemoveRankFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :rank, :integer
  end
end
