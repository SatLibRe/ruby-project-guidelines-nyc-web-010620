class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :date
      t.integer :home_team_id
      t.integer :visitor_team_id
      t.integer :home_team_score
      t.integer :visitor_team_score
      t.integer :period 
      t.boolean :postseason
      t.integer :season
      t.string  :status
      t.string :time

    end 
  end
end
