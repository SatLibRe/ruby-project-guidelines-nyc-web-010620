require_relative "./game.rb"
require_relative "./player.rb"
require_relative "./team.rb"
require_relative "./command_line_interface.rb"
require "pry"

class CommandLineInterface
   
    def greet
        puts "\e[H\e[2J"
      puts "\n\n\n\n\n      888888b.   d8b                                                 888b    888 888888b.         d8888 888 
      888   88b  Y8P                                                 8888b   888 888   88b       d88888 888 
      888  .88P                                                      88888b  888 888  .88P      d88P888 888 
      8888888K.  888 88888888 88888888  8888b.  888d888 .d88b.       888Y88b 888 8888888K.     d88P 888 888 
      888   Y88b 888    d88P     d88P       88b 888P   d88 88b       888 Y88b888 888   Y88b   d88P  888 888 
      888    888 888   d88P     d88P   .d888888 888    888  888      888  Y88888 888    888  d88P   888 Y8P 
      888   d88P 888  d88P     d88P    888  888 888    Y88..88P      888   Y8888 888   d88P d8888888888    
      8888888P   888 88888888 88888888  Y888888 888      Y88P        888    Y888 8888888P  d88P     888 888"
      puts "\nWelcome to Bizzaro NBA! Where Players and Stats are flipped on their head"
        
    end 

    
$prompt = TTY::Prompt.new

    def valid_response_player?(input) 
        Player.all.each do |player|
            if player.last_name.downcase == input.downcase 
                return true  
            end 
        end 
        false 
    end 

    def valid_response_date?(input) 
        Game.all.each do |game|
            if game.date == input.to_s
                return true  
            end 
        end 
        false 
    end 

    def valid_response_city?(input)
        Team.all.each do |team|
            if team.city.downcase == input.downcase
                return true
            end 
        end 
        false 
    end

    def edit_player(input)
        player_to_update = Player.find_by(last_name: input.downcase.capitalize)
        what_to_be_updated = $prompt.select("\nWhat would you like to edit about them:",["First Name", "Last Name", "Height in Feet","Height in Inches", "Position","Team","Weight","PPG","Exit"])
        case what_to_be_updated
            when "First Name"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(first_name: changer.downcase.capitalize)
                puts "\nPlayer updated!"
            when "Last Name"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(last_name: changer.downcase.capitalize)
                puts "\nPlayer updated!"
            when "Height in Feet"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(height_feet: changer)
                puts "\nPlayer updated!"
            when "Height in Inches"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(height_inches: changer)
                puts "\nPlayer updated!"
            when "Position"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(position: changer)
                puts "\nPlayer updated!"
            when "Team"
                teamer = $prompt.ask("\nWhat Team name would you like to change it to?") 
                changer = Team.find_by(name: teamer.downcase.capitalize).team_id
                player_to_update.update(team_id: changer)
                puts "\nPlayer updated!"
            when "Weight"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(weight: changer)
                puts "\nPlayer updated!"
            when "PPG"
                changer = $prompt.ask("\nWhat would you like to change it to?") 
                player_to_update.update(PPG: changer)
                puts "\nPlayer updated!"
            end 
    end 

    def games_played(input)
        player_games = Player.find_by(last_name: input.downcase.capitalize).games
            player_games.map do |game|
                 "#{Team.find_by(team_id: game.home_team_id).name}: #{game.home_team_score} - #{Team.find_by(team_id: game.visitor_team_id).name}: #{game.visitor_team_score}"
            end
    end 

    def team_games_played(input)
        team_games = Team.find_by(city: input).games
            team_games.map do |game|
                "#{Team.find_by(team_id: game.home_team_id).name}: #{game.home_team_score} - #{Team.find_by(team_id: game.visitor_team_id).name}: #{game.visitor_team_score}"
            end
    end 

    def player_printer(input)
     player_arr = []
        Team.find_by(city: input).players.each do |player|
            player_arr.push("\nFirst Name: #{player[:first_name]}")
            player_arr.push("Last Name: #{player[:last_name]}")
            player_arr.push("Position: #{player[:position]}")
            player_arr.push("PPG: #{player[:PPG]}")  
            player_arr.push("Height: #{player[:height_feet]}'#{player[:height_inches]}") 
            player_arr.push("Weight: #{player[:weight_pounds]}")
        end
        player_arr 
    end 

  
   


  

    def run
    while true do 
        input = $prompt.select("\nPlease choose an option:",["Search for a Team by city", "Search for a Player", "List all players","Search for a Game by Date", "List Top 10 Scorers","Create Player","Delete Player","Edit Player","Exit"])
        case input
            when "Search for a Player"
                input = $prompt.ask("\nPlease enter a player's last name:")
                if valid_response_player?(input) == true
                    player = Player.find_by(last_name: input.downcase.capitalize)
                    puts "\nFirst Name: #{player[:first_name]}"
                    puts "Last Name: #{player[:last_name]}"
                    puts "Position: #{player[:position]}"
                    puts "Team: #{Team.find_by(team_id: player[:team_id]).name}"
                    puts "PPG: #{player[:PPG]}"  
                    puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
                    puts "Weight: #{player[:weight_pounds]}"
                    second_input = $prompt.select("\nPlease choose an option:",["Delete Player","Edit Player","See Team's Games Played","Exit"])
                        case second_input
                            when "Delete Player"
                                Player.find_by(last_name: input.downcase.capitalize).delete
                                puts "\nPlayer Deleted!"
                            when "Edit Player"
                                edit_player(input)
                            when "See Team's Games Played"    
                                 games_played(input).length != 0 ? (puts games_played(input)) : (puts "\nNo games played!")
                         end 
                else 
                    puts "\nPlease enter a valid name"
                end 
            when "List all players"
                Player.all.each do |player|
                    puts "#{player.first_name} #{player.last_name} - #{Team.find_by(team_id: player[:team_id]).name}"
                end 
            when "Search for a Team by city"
                input = $prompt.ask("\nPlease enter a Team city")
                input = input.split.map(&:capitalize).join(' ')
                if valid_response_city?(input) == true
                    team = Team.find_by(city: input)
                    puts "\nAbbreviation: #{team[:abbreviation]}"
                    puts "Conference: #{team[:conference]}"
                    puts "Division: #{team[:division]}" 
                    puts "Full Name: #{team[:full_name]}"
                    puts "Team Name: #{team[:name]}"
                    second_input = $prompt.select("\nPlease choose an option:",["See Players","See Games Played","Exit"])
                        case second_input
                        when "See Players"
                            player_printer(input).length !=0 ? (puts player_printer(input)) : (puts "\nThey have no players!")
                        when "See Games Played"
                            team_games_played(input).length != 0 ? (puts team_games_played(input)) : (puts "\nNo games played!")
                        end
                else 
                    puts "\nPlease enter a valid city"
                end 
            when "Search for a Game by Date"
                puts "\nPlease enter a Game date(YYYY-MM-DD FORMAT)"
                input = gets.strip.to_s
                if valid_response_date?(input) == true
                    game = Game.find_by(date: input)
                    puts "\nDate: #{game[:date]}"
                    puts "Score: #{Team.find_by(team_id: game.home_team_id).name}: #{game.home_team_score} - #{Team.find_by(team_id: game.visitor_team_id).name}: #{game.visitor_team_score} "
                else
                    puts "\nPlease enter a valid date"
                end 
            when "List Top 10 Scorers"
                player_arr = Player.order(PPG: :desc).to_a.slice(0,10)
                player_arr.each do |player|
                    puts "#{player.first_name} #{player.last_name}: #{player.PPG}"
                end 
            when "Create Player"
                fname = $prompt.ask("Whats your first name?")
                lname = $prompt.ask("Whats your last name?")
                hfeet = $prompt.ask("Whats your height in feet?")
                hinches = $prompt.ask("... and in inches?")
                pos = $prompt.ask("What is your position?")
                myteam = $prompt.ask("What team do you want to be on?")
                myteamid = Team.find_by(name: myteam.downcase.capitalize).team_id
                fat = $prompt.ask("Whats is your weight?")
                pavg = $prompt.ask("How many points are you averaging?")
                Player.create(:first_name => fname.strip.downcase.capitalize, :height_feet => hfeet, :height_inches => hinches, :last_name => lname.strip.downcase.capitalize, :position => pos.strip, :team_id => myteamid, :weight_pounds => fat, :PPG => pavg) 
                puts "\nPlayer Created!"
            when "Delete Player"
                to_delete = $prompt.ask("What is the last name of the player you would like to delete?")
                Player.find_by(last_name: to_delete.strip.downcase.capitalize).delete
                puts "\nPlayer Deleted!"
            when "Edit Player"
                player_to_update = $prompt.ask("\nWhat is the last name of the player you would like to edit?")
                player_to_update = Player.find_by(last_name: player_to_update.strip.downcase.capitalize)
                what_to_be_updated = $prompt.select("\nWhat would you like to edit about them:",["First Name", "Last Name", "Height in Feet","Height in Inches", "Position","Team","Weight","PPG","Exit"])
                case what_to_be_updated
                    when "First Name"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(first_name: changer.strip.downcase.capitalize)
                        puts "\nPlayer updated!"
                    when "Last Name"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(last_name: changer.strip.downcase.capitalize)
                        puts "\nPlayer updated!"
                    when "Height in Feet"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(height_feet: changer)
                        puts "\nPlayer updated!"
                    when "Height in Inches"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(height_inches: changer)
                        puts "\nPlayer updated!"
                    when "Position"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(position: changer)
                        puts "\nPlayer updated!"
                    when "Team"
                        teamer = $prompt.ask("\nWhat Team name would you like to change it to?") 
                        changer = Team.find_by(name: teamer.downcase.capitalize).team_id
                        player_to_update.update(team_id: changer)
                        puts "\nPlayer updated!"
                    when "Weight"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(weight: changer)
                        puts "\nPlayer updated!"
                    when "PPG"
                        changer = $prompt.ask("\nWhat would you like to change it to?") 
                        player_to_update.update(PPG: changer)
                        puts "\nPlayer updated!"
                    end 
            when "Exit"
                break
            end 
        end 
    end  


end 