require_relative "./game.rb"
require_relative "./player.rb"
require_relative "./team.rb"
require_relative "./command_line_interface.rb"
require "pry"

class CommandLineInterface
   
    def greet 
      puts "\n\n\n\n\n      888888b.   d8b                                                 888b    888 888888b.         d8888 888 
      888   88b  Y8P                                                 8888b   888 888   88b       d88888 888 
      888  .88P                                                      88888b  888 888  .88P      d88P888 888 
      8888888K.  888 88888888 88888888  8888b.  888d888 .d88b.       888Y88b 888 8888888K.     d88P 888 888 
      888   Y88b 888    d88P     d88P       88b 888P   d88 88b       888 Y88b888 888   Y88b   d88P  888 888 
      888    888 888   d88P     d88P   .d888888 888    888  888      888  Y88888 888    888  d88P   888 Y8P 
      888   d88P 888  d88P     d88P    888  888 888    Y88..88P      888   Y8888 888   d88P d8888888888    
      8888888P   888 88888888 88888888  Y888888 888      Y88P        888    Y888 8888888P  d88P     888 888"
      puts "\n\nWelcome to Bizzaro NBA! Where Players and Stats are flipped on their head"
        
    end 

    def display_menu 
        puts "Please choose an option"
        puts "1. Search for a Team by name "
        puts "2. Search for a Player"
        puts "3. Search for a Game by Date"
    end 

    def run
        input = ""
        while input 
          puts "Please enter a command:"
          input = gets.strip.to_s
            case input 
            when "1"
                # play(songs)
              when "2"
                puts "Please enter a player's first name"
                input = gets.strip.to_s
                player = Player.find_by(first_name: input.downcase.capitalize)
                puts "First Name: #{player[:first_name]}"
                puts "Last Name: #{player[:last_name]}"
                puts "Position: #{player[:position]}"
                puts "PPG: #{player[:PPG]}"  
                puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
                puts "Weight: #{player[:weight_pounds]}"
              when "3"
                # exit_jukebox 
                break
            end 
        end
      end 

end 