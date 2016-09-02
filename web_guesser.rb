require 'sinatra'
require "sinatra/reloader"

rng = rand(101)
get '/' do
	"The SECRET NUMBER is #{rng}"
end