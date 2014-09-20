# myapp.rb
require 'sinatra'
require 'sendgrid-ruby'

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
