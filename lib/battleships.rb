require 'sinatra/base'
require_relative 'game'

class BattleShips < Sinatra::Base

set :views, Proc.new { File.join(root, '..', "views") }
enable :sessions

	def initialize
  		@game = Game.new
  		super
	end

  get '/' do
    'Hello BattleShips!'
    erb :index
  end

  get '/register' do
    'What\'s your name?'
    erb :register
  end

  post '/register' do
    @name = params[:name]
    session[:player_name] = params[:name]
    @game.add_player(@name)
    redirect '/waiting'
  end

  get '/waiting' do
    erb :waiting
  end

  # start the server if ruby file executed directly
  if app_file == $0
  	run!
  end
end
