# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/game'

def get_a_location
  grid = [['a1', 'b1', 'c1', 'd1', 'e1'],
                ['a2', 'b2', 'c2', 'd2', 'e2'],
                ['a3', 'b3', 'c3', 'd3', 'e3'],
                ['a4', 'b4', 'c4', 'd4', 'e4'],
                ['a5', 'b5', 'c5', 'd5', 'e5']]
  row =  (0..4).to_a.sample
  col =  (0..4).to_a.sample
  grid[col][row]
end      

post '/' do
  subject = params[:subject].downcase
  if subject.include?"challenge"
    @from = params[:from].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
    subs = subject.split
    subs.each_with_index{ |element,index|
      if element.eql?"challenge"
        Game.create(:player_one => @from[0], :player_two => subs[index+1], :player_one_ship_location => get_a_location, :player_two_ship_location => get_a_location)
      end
    } 
  end
  200
end
