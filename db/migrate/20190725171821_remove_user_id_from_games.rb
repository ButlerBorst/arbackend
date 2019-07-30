class RemoveUserIdFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :user_id, :integer
  end
end
