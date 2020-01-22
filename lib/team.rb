class Team < ActiveRecord::Base
    has_many :players
    has_many :games

    def games
        Game.all.select do |game|
            game.home_team_id == self.id || game.visitor_team_id == self.id
        end 
    end 
end 