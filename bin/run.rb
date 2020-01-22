require_relative '../config/environment'

cli = CommandLineInterface.new
cli.greet
puts ""
cli.display_menu
cli.run

