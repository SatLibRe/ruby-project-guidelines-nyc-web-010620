class Player < ActiveRecord::Base
    belongs_to :team
    has_many :games, through: :team

    def games 
        Game.all.select do |game|
            game.home_team_id == self.team_id || game.visitor_team_id == self.team_id
        end 
    end 
end 