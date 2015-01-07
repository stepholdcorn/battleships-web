require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'ship'
require_relative 'water'
require_relative 'cell'

class BattleShips < Sinatra::Base

set :views, Proc.new { File.join(root, '..', "views") }

	def initialize
  		@game = Game.new
      @board = Board.new(Cell)
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
      erb :error
    else
      @player = Player.new
      @player.name = @name
      @game.add_player(@player)
      erb :registered
    end
  end

  get '/ship_placement' do
    erb :ship_placement
  end

  post '/ship_placement' do
    @aircraft_carrier = @board.place(Ship.aircraft_carrier, params[:ac_coord].to_sym, params[:ac_orientation].to_sym)
    # @aircraft_carrier = [params[:ac_coord], params[:ac_orientation]]
    @battleship = [params[:bs_coord], params[:bs_orientation]]
    @destroyer = [params[:d_coord], params[:d_orientation]]
    @submarine = [params[:s_coord], params[:s_orientation]]
    @patrol_boat = [params[:pb_coord], params[:pb_orientation]]
    erb :game_page
  end

  # start the server if ruby file executed directly
  if app_file == $0
  	run!
  end
end
