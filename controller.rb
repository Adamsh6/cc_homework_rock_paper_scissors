require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')

require_relative('models/game.rb')
also reload('models/*')

def rock_paper_shotgun(params)
  game = Game.new(params[:player1] params[:player2])
  return game.compare_choices
end

get '/:player1/:player2'
  result = rock_paper_shotgun(params)
  if result == 0
    return "It's a draw!"
  elsif result == 1
    return "Player 1 won using #{player1}!"
  else
    return "Player 2 won using #{player2}"
  end
end
