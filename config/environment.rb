require 'bundler'
Bundler.require
# require "bcrypt"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'
require_relative "../lib/game.rb"
require_relative "../lib/player.rb"
require_relative "../lib/team.rb"
require_relative "../lib/command_line_interface.rb"
