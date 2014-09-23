# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/game'

post '/' do
  subject = params[:subject].downcase
  if subject.include?"challenge"
    @from = params[:from].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
    subs = subject.split
    subs.each_with_index{ |element,index|
      if element.eql?"challenge"
        Game.create(:player_one => @from[0], :player_two => subs[index+1])
      end
    } 
  end
  200
end
