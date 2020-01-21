class Team < ActiveRecord::Base

    def players
    team_arr = []
        Player.all.each do |player|
            if self.id == player.team_id
                team_arr.push(player)
            end 
        end 
        team_arr
    end

end 