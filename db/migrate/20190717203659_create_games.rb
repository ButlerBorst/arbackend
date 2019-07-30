class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :points
      t.integer :win
      t.integer :loss
      t.integer :rank
      t.timestamps
    end
  end
end
