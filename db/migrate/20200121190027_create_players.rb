class CreatePlayers < ActiveRecord::Migration[5.0]
  def change 
    create_table :players do |t|
      t.string :first_name 
      t.integer :height_feet 
      t.integer :height_inches
      t.string :last_name 
      t.string :position
      t.integer :team_id
    end 
  end
end
