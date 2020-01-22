# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200122154248) do

  create_table "games", force: :cascade do |t|
    t.integer "date"
    t.integer "home_team_id"
    t.integer "visitor_team_id"
    t.integer "home_team_score"
    t.integer "visitor_team_score"
    t.integer "period"
    t.boolean "postseason"
    t.integer "season"
    t.string  "status"
    t.string  "time"
  end

  create_table "players", force: :cascade do |t|
    t.string  "first_name"
    t.integer "height_feet"
    t.integer "height_inches"
    t.string  "last_name"
    t.string  "position"
    t.integer "team_id"
    t.integer "weight_pounds"
    t.float   "PPG"
  end

  create_table "teams", force: :cascade do |t|
    t.string "abbreviation"
    t.string "city"
    t.string "conference"
    t.string "division"
    t.string "full_name"
    t.string "name"
  end

end
