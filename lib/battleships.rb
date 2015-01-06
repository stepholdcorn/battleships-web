require 'sinatra/base'
require_relative 'game'

class BattleShips < Sinatra::Base

set :views, Proc.new { File.join(root, '..', "views") }

	def initialize
		puts "initialize called"
		puts "Creating a game"
  		@game = Game.new
  		super
	end

  get '/' do
    'Hello BattleShips!'
    @name = params[:name]

    if @game.player1.name
      @game.player2.name = @name
    else
      @game.player1.name = @name
    end

    @game.add_player(@name)
    erb :index
  end

  get '/register' do
    'What\'s your name?'
    erb :register
  end

  # start the server if ruby file executed directly
  if app_file == $0
  	run!
  end
end
