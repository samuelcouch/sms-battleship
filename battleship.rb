require 'sinatra'
require 'sendgrid-ruby'

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



post '/' do
  subject = params[:subject]

case Responses
  when subject.include? "Challenge"
      puts "It's between 1 and 5"
      subject_array = subject.split
      challengee = subject_array[1]
    mail = SendGrid::Mail.new do |m|
        m.to = challengee
        m.from = 'game@capsize.me'
        m.subject = 'You\'ve been challenged!'
        m.text = 'Your fellow coworker/friend just challenged you to a game of battleship. To play, reply by putting a Letter between A and E and a number between 1 and 5 in the subject line'
      end
      puts client.send(mail)
      mail = SendGrid::Mail.new do |m|
        m.to = challenger
        m.from = 'game@capsize.me'
        m.subject='Prepare'
        m.text='You\'ve sent out an invite, waiting for a response...
        Here\'s something to keep you company: https://www.youtube.com/watch?v=nfWlot6h_JM'
      end
      puts client.sent(mail)

  when subject.length = 2
    hit = subject
    #if hit
  when String
    puts "You passed a string"
  else

200

end
end
