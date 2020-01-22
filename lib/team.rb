class Team < ActiveRecord::Base
    has_many :players
    has_many :games

    def games
        Game.all.select do |game|
            game.home_team_id == self.team_id || game.visitor_team_id == self.team_id
        end 
    end 

    def players 
        Player.all.select do |player|
            player.team_id == self.team_id
        end 
    end 
end 