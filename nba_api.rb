require 'unirest'

# Teams API

teams_api = Unirest.get "https://free-nba.p.rapidapi.com/teams",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

teams = {}
teams = teams_api.body
teams = teams["data"]

# i = 0
# while i < teams.length do 
# 	puts teams[i]["full_name"]
# 	i += 1
# end 

# Games API

games_api = Unirest.get "https://free-nba.p.rapidapi.com/games",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

games = {}
games = games_api.body
games = games["data"]
games

# Players API

players_api = Unirest.get "https://free-nba.p.rapidapi.com/players",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

players = {}
players = players_api.body
players = players["data"]
players

# Stats API

stats_api = Unirest.get "https://free-nba.p.rapidapi.com/stats",
  headers:{
    "X-RapidAPI-Host" => "free-nba.p.rapidapi.com",
    "X-RapidAPI-Key" => "da38e79dd4msh1ce84dac4969474p12469djsnd69e872f4266"
  }

stats = {}
stats = stats_api.body
stats = stats["data"]
stats