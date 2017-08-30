class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|      
      t.references :user, index: true, foreign_key: true
      t.integer :score
      t.integer :games_played

      t.timestamps null: false
    end
  end
end
