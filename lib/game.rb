class Game < ActiveRecord::Base
    has_many :teams 
    has_many :players, through: :teams

    def teams
        Team.all.select do |team|
            self.home_team_id == team.team_id || self.visitor_team_id == team.team_id
        end 
    end 


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