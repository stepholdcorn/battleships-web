require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'ship'
require_relative 'water'
require_relative 'cell'

class BattleShips < Sinatra::Base

  set :views, Proc.new { File.join(root, '..', "views") }
  enable :sessions

	game = Game.new
  board = Board.new(Cell)

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    @name = params[:name]
    if @name.length == 0
      erb :error
    else
      @player = Player.new
      @player.name = @name
      session[:player] = @player.object_id
      game.add_player(@player)
      erb :registered
    end
  end

  get '/ship_placement' do
    erb :ship_placement
  end

  post '/ship_placement' do
    @player = session[:player]
    @aircraft_carrier = board.place(Ship.aircraft_carrier, params[:ac_coord].to_sym, params[:ac_orientation].to_sym)
    @battleship = board.place(Ship.battleship, params[:bs_coord].to_sym, params[:bs_orientation].to_sym)
    @destroyer = board.place(Ship.destroyer, params[:d_coord].to_sym, params[:d_orientation].to_sym)
    @submarine = board.place(Ship.submarine, params[:s_coord].to_sym, params[:s_orientation].to_sym)
    @patrol_boat = board.place(Ship.patrol_boat, params[:pb_coord].to_sym, params[:pb_orientation].to_sym)
    redirect '/game_page'
  end

  get '/game_page' do
    @player = session[:player]
    @board = board
    erb :game_page
  end

  # start the server if ruby file executed directly
  if app_file == $0
  	run!
  end
end
