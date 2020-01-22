require_relative "./game.rb"
require_relative "./player.rb"
require_relative "./team.rb"
require_relative "./command_line_interface.rb"
require "pry"

class CommandLineInterface
   
    def greet 
        puts "Welcome to Bizzaro NBA! Where Players and Stats are flipped on their head"
        
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
              when "2"
                puts "Please enter a player's first name"
                input = gets.strip.to_s
                player = Player.find_by(first_name: input.downcase.capitalize)
                puts "First Name: #{player[:first_name]}"
                puts "Last Name: #{player[:last_name]}"
                puts "Position: #{player[:position]}"
                puts "Height: #{rand}" 
                # puts player[:height_inches]
              when "2"
                # play(songs)
              when "3"
                # exit_jukebox 
                break
            end 
        end
      end 

end 