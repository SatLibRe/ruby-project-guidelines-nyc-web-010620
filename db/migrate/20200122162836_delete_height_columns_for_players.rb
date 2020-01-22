class DeleteHeightColumnsForPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :height_feet
    remove_column :players, :height_inches
  end
end
