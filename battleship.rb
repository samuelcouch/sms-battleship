# myapp.rb
require 'sinatra'
require 'sendgrid-ruby'
require 'json'
require 'mail'

grid = [['a1', 'b1', 'c1', 'd1', 'e1'],
           ['a2', 'b2', 'c2', 'd2', 'e2'], 
           ['a3', 'b3', 'c3', 'd3', 'e3'], 
           ['a4', 'b4', 'c4', 'd4', 'e4'], 
           ['a5', 'b5', 'c5', 'd5', 'e5']]

class Player
  attr_accessor :name, :ship

  def initialize(name)
    @name = name
    @ship = Ship.new()
  end
end

class Ship
  attr_accessor :row, :col, :location, :sunk 

  def initialize()
    @row =  (0..4).to_a.sample
    @col =  (0..4).to_a.sample
    @location = grid[@col][@row]
  end

  def is_sunk?
    @sunk.is_sunk?
  end
end

get '/' do
  'Hello world!'
  client = SendGrid::Client.new do |c|
    c.api_user = 'guozhaonan'
    c.api_key = 'albertguo213-41'
  end

  mail = SendGrid::Mail.new do |m|
    m.to = 'guozhaonan@gmail.com'
    m.from = 'albert@innoblue.org'
    m.subject = 'Hello world!'
    m.text = 'I heard you like pineapple.'
  end

puts client.send(mail)

end

post '/' do
  puts params[:subject]
  200
end