require_relative "./game.rb"
require_relative "./player.rb"
require_relative "./team.rb"
require_relative "./command_line_interface.rb"
require "pry"

class CommandLineInterface
   
    def greet 
        puts "Welcome to Bizzaro NBA! Where Players and Stats are flipped on their head"
    end 

    def ttyprompt(text,arr)
        prompt = TTY::Prompt.new
        prompt.select(text,arr)
    end

    def run
    while "code" do 
        input = ttyprompt("Please choose an option",["Search for a Team by name", "Search for a Player", "List all players","Exit"])
        case input
            when "Search for a Player"
                puts "Please enter a player's first name"
                input = gets.strip.to_s
                player = Player.find_by(first_name: input.downcase.capitalize)
                puts "First Name: #{player[:first_name]}"
                puts "Last Name: #{player[:last_name]}"
                puts "Position: #{player[:position]}"
                puts "PPG: #{player[:PPG]}"  
                puts "Height: #{player[:height_feet]}'#{player[:height_inches]}" 
                puts "Weight: #{player[:weight_pounds]}"
            when "List all players"
                Player.all.each do |player|
                    puts "#{player.first_name} #{player.last_name}"
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