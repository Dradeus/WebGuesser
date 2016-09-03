require 'sinatra'
require "sinatra/reloader"

@@secret_number = rand(100)
@@number_of_guesses = 5

get '/' do
	if params["guess"].to_s.empty?
		
	message = "please input a guess"
		erb :index, :locals => {:number => @@secret_number,
												  :message => message, :guesses => @@number_of_guesses}
	else 
		@@number_of_guesses -= 1
		guess = params["guess"].to_i
		message = check_guess(guess)
		params["guess"] = ""
		erb :index, :locals => {:number => @@secret_number,
												  :message => message, :guesses => @@number_of_guesses}
	end
end

def check_guess(guess)
	if @@number_of_guesses == 0
		@@secret_number = rand(100)
		@@number_of_guesses = 5
		message = "You have lost, a new number has been generated"
	
	elsif guess > @@secret_number
		if guess > @@secret_number+5
			message = "Way too high!"
		else
			message = "Too high!"
		end

	elsif guess < @@secret_number
		if guess < @@secret_number-5
			message = "Way too low!"
		else
			message = "Too low!"
		end

	else
		@@secret_number = rand(100)
		@@number_of_guesses = 5
		message = "You got it right!"
	end
end