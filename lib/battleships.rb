require 'sinatra/base'
require_relative 'game'
require_relative 'player'

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
    if @name.length == 0
      redirect '/error'
    else
      @player = Player.new
      @player.name = @name
      session[:player] = @player.object_id
      @game.add_player(@player)
      redirect '/waiting'
    end
  end

  get '/waiting' do
    erb :waiting
  end

  get '/error' do
    erb :error
  end

  # start the server if ruby file executed directly
  if app_file == $0
  	run!
  end
end
