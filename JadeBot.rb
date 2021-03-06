require 'discordrb'
require 'configatron'
require_relative 'config.rb'

##Globals

jade = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: configatron.id, prefix: '>'

##Greeters

jade.member_join() do |event|
	jade.send_message(event.server.default_channel(),"hey #{event.user.mention}, welcome to **#{event.server.name}**! :D")
end

jade.member_leave() do |event|
	jade.send_message(event.server.default_channel(),"#{event.user.mention} left **#{event.server.name}**! D:")
end

##Other Responses

jade.message(contains: /love jade/i) do |event|
	event.send_message("i love you too #{event.user.mention}! :green_heart:")
end

jade.message(contains: /owo/i) do |event|
	event.send_message('whats this :o')
end

jade.mention() do |event|
	jade.send_message(event.channel, "whats up :?")
end

jade.message(contains: /good dog/i) do |event|
	event.send_message("best friend")
end

##initialize bot

jade.run