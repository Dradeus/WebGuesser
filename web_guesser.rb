require 'sinatra'
require "sinatra/reloader"

SECRET_NUMBER = rand(100)

get '/' do
	guess = params["guess"].to_i
	message = check_guess(guess)
	erb :index, :locals => {:number => SECRET_NUMBER,
												  :message => message}
end

def check_guess(guess)
	if guess > SECRET_NUMBER
		if guess > SECRET_NUMBER+5
			message = "Way too high!"
		else
			message = "Too high!"
		end

	elsif guess < SECRET_NUMBER
		if guess < SECRET_NUMBER-5
			message = "Way too low!"
		else
			message = "Too low!"
		end
		
	else
		message = "You got it right!"
	end
end
