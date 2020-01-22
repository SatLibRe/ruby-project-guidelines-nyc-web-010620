class CreateTeamId < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :team_id, :integer
  end
end
