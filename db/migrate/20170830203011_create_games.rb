class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_played
      t.references :oponent, index: true, foreign_key: true
      t.integer :score_oponent
      t.references :user, index: true, foreign_key: true
      t.integer :user_score

      t.timestamps null: false
    end
  end
end
