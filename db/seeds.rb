require 'unirest'
require "pry"

Player.destroy_all
Team.destroy_all
Game.destroy_all




# Teams API

teams_api = Unirest.get "https://free-nba.p.rapidapi.com/teams",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }


teams = {}
teams = teams_api.body
teams = teams["data"]

def team_popluator(teams) 
    teams.each do |team|
        Team.create(:abbreviation => team["abbreviation"], :team_id => team["id"],
        :city => team["city"], :conference => team["conference"], :division => team["division"], :full_name => team["full_name"], :name => team["name"]) 
    end  
end

team_popluator(teams)


###################################################################################
# Games API

games_api = Unirest.get "https://free-nba.p.rapidapi.com/games",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

games = {}
games = games_api.body
games = games["data"]

def game_popluator(games) 
  games.each do |game|
      Game.create(:date => Time.at(rand * Time.now.to_i).to_s.split(" ")[0],
      :home_team_id => game["home_team"]["id"], :visitor_team_id => game["visitor_team"]["id"], :home_team_score => game["home_team_score"], :visitor_team_score => game["visitor_team_score"],
      :period => game["period"], :postseason => game["postseason"], :season => game["season"], :status => game["status"], :time => game["time"]) 
  end  
end

game_popluator(games)

###################################################################################
# Players API

players_api = Unirest.get "https://free-nba.p.rapidapi.com/players",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

players = {}
players = players_api.body
players = players["data"]

def player_popluator(players) 
  players.each do |player|
      Player.create(:first_name => player["first_name"],
      :height_feet => rand(3..12), :height_inches => rand(1..11), :last_name => player["last_name"], :position => player["position"],
      :team_id => player["team"]["id"], :weight_pounds => rand(110..320), :PPG => rand(5..65).to_f) 
  end  
end

player_popluator(players)