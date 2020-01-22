class Game < ActiveRecord::Base
    has_many :teams 
    has_many :players, through: :teams

    def teams
        Team.all.select do |team|
            self.home_team_id == team.team_id || self.visitor_team_id == team.team_id
        end 
    end 

    #looks like it works, need to find game that has players on home and away side 6 and 12?? Game 8
    #verified
    def players 
     players_arr = [] 
        teams.each do |team|
           Player.all.each do |player|
                if player.team_id == team.team_id 
                    players_arr.push(player) 
                end 
           end  
        end 
        players_arr
    end 

end 