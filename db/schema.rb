# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140529212925) do

  create_table "boroughs", :force => true do |t|
    t.string   "name"
    t.string   "inner_outer"
    t.decimal  "population"
    t.decimal  "population_density"
    t.decimal  "average_age"
    t.decimal  "population_percent_youth"
    t.decimal  "population_percent_working"
    t.decimal  "population_percent_senior"
    t.decimal  "population_percent_foreign"
    t.string   "first_largest_immigrant_group"
    t.string   "second_largest_immigrant_group"
    t.string   "third_largest_immigrant_group"
    t.decimal  "employment_rate"
    t.decimal  "gross_annual_pay"
    t.decimal  "crime_rates_per_capita"
    t.decimal  "percent_greenspace"
    t.decimal  "percent_cycling_adults"
    t.decimal  "life_satisfaction_score"
    t.decimal  "worthwhileness_score"
    t.decimal  "happiness_score"
    t.decimal  "anxiety_score"
    t.string   "political_control"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end
