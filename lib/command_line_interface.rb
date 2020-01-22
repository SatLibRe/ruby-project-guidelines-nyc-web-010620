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

    def ttyprompt(text,arr)
        prompt = TTY::Prompt.new
        prompt.select(text,arr)
    end

    def valid_response_player?(input) 
        Player.all.each do |player|
            if player.first_name.downcase == input.downcase 
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

    def run
    while true do 
        input = ttyprompt("\nPlease choose an option",["Search for a Team by city", "Search for a Player", "List all players","Search for a Game by Date","Exit"])
        case input
            when "Search for a Player"
                puts "\nPlease enter a player's first name"
                input = gets.strip.to_s
                if valid_response_player?(input) == true
                    player = Player.find_by(first_name: input.downcase.capitalize)
                    puts "First Name: #{player[:first_name]}"
                    puts "Last Name: #{player[:last_name]}"
                    puts "Position: #{player[:position]}"
                    puts "PPG: #{player[:PPG]}"  
                    puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
                    puts "Weight: #{player[:weight_pounds]}"
                else 
                    puts "\nPlease enter a valid name"
                end 
            when "List all players"
                Player.all.each do |player|
                    puts "#{player.first_name} #{player.last_name}"
                end 
            when "Search for a Team by city"
                puts "\nPlease enter a Team city"
                input = gets.strip.to_s
                if valid_response_city?(input) == true
                    team = Team.find_by(city: input)
                    puts "\nAbbreviation: #{team[:abbreviation]}"
                    puts "Conference: #{team[:conference]}"
                    puts "Division: #{team[:division]}" 
                    puts "Full Name: #{team[:full_name]}"
                    puts "Team Name: #{team[:name]}"
                else 
                    puts "\nPlease enter a valid city"
                end 
            when "Search for a Game by Date"
                puts "\nPlease enter a Game date"
                input = gets.strip.to_s
                if valid_response_date?(input) == true
                    game = Game.find_by(date: input)
                    puts "Date: #{game[:date]}"
                    puts "Score: #{Team.find_by(team_id: game.home_team_id).name}: #{game.home_team_score} - #{Team.find_by(team_id: game.visitor_team_id).name}: #{game.visitor_team_score} "
                else
                    puts "\nPlease enter a valid date"
                end 
            when "Exit"
                break
            end 
        end 
    end  

    # def run
    #     input = ttyprompt("Please choose an option",["Search for a Team by name", "Search for a Player", "List all players"])
    #     if input == "Search for a Player"
    #         puts "Please enter a player's first name"
    #         input = gets.strip.to_s
    #         player = Player.find_by(first_name: input.downcase.capitalize)
    #         puts "First Name: #{player[:first_name]}"
    #         puts "Last Name: #{player[:last_name]}"
    #         puts "Position: #{player[:position]}"
    #         puts "PPG: #{player[:PPG]}"  
    #         puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
    #         puts "Weight: #{player[:weight_pounds]}"
    #     elsif input == "List all players"
    #         Player.all.each do |player|
    #             puts "#{player.first_name} #{player.last_name}"
    #         end 
    #     end 
    # end 


    # def run
    #     input = ""
    #     while input 
    #       puts "Please enter a command:"
    #       input = gets.strip.to_s
    #         case input 
    #         when "1"
    #             # play(songs)
    #           when "2"
    #             puts "Please enter a player's first name"
    #             input = gets.strip.to_s
    #             player = Player.find_by(first_name: input.downcase.capitalize)
    #             puts "First Name: #{player[:first_name]}"
    #             puts "Last Name: #{player[:last_name]}"
    #             puts "Position: #{player[:position]}"
    #             puts "PPG: #{player[:PPG]}"  
    #             puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
    #             puts "Weight: #{player[:weight_pounds]}"
    #           when "3"
    #             # exit_jukebox 
    #             break
    #         end 
    #     end
    #   end 

end 