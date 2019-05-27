require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')

require_relative('models/game.rb')
also_reload('models/*')

def rock_paper_scissors(params)
  game = Game.new(params[:player1], params[:player2])
  return game.compare_choices
end

get '/' do
  erb( :home )
end

get '/:player1/:player2' do
  result = rock_paper_scissors(params)
  if result == 0
    @outcome = "It's a draw!"
  elsif result == 1
    @outcome = "Player 1 won using #{params[:player1]}!"
  else
    @outcome = "Player 2 won using #{params[:player2]}"
  end
  # return @outcome
   erb( :result )
end

get '/:player1' do
  @p1_choice = params[:player1]
  erb( :next_pick)
end
