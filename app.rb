# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/game'

@board = [['a1', 'b1', 'c1', 'd1', 'e1'],
                ['a2', 'b2', 'c2', 'd2', 'e2'],
                ['a3', 'b3', 'c3', 'd3', 'e3'],
                ['a4', 'b4', 'c4', 'd4', 'e4'],
                ['a5', 'b5', 'c5', 'd5', 'e5']]
@r_board = /#{@board.join("|")}/

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

def get_unique_locations
  a = get_a_location
  b = get_a_location
  until a!=b
    b = get_a_location
  end
  return [a, b]
end

def is_turn(game_id, player)

end

def find_game(sender)
  Game.find_by(player_two: sender, active_game: true)  || Game.find_by(player_one: sender, active_game: true) || nil
end

post '/' do
  @subject = params[:subject].downcase
  @from = params[:from].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
  @from = @from[0]
  if subject.include?"challenge"
    subs = @subject.split
    subs.each_with_index{ |element,index|
      if element.eql?"challenge"
        locs = get_unique_locations
        Game.create(:player_one => @from, :player_two => subs[index+1], :player_one_ship_location => locs[0], :player_two_ship_location => locs[1])
      end
    } 
  end
elsif find_game(@from).present?
    game = find_game(@from)
    if @from.eql?game[:player_one] and (game[:turns_players]%2 ==  0)
        if @subject === @r_board
          #the sender is player one, and it's the their turn, and the subject contains one of the valid positions
        end
    end
  200
end
