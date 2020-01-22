class AddColumnToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :PPG, :float
    end 
end
