# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/game'

get '/' do
  Game.create(:player_one => "test", :player_two => "test2")
end
