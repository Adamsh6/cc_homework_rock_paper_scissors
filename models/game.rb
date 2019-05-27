class Game

  def initialize(player1_choice, player2_choice)
    @player1 = player1_choice
    @player2 = player2_choice
  end

  def compare_choices
    if @player1 == @player_2
      return 0
    elsif (@player1 == "scissors" && @player2 == "paper") || (@player1 == "paper" && @player2 == "rock" || @player1 == "rock" && @player2 == "scissors")
      return 1
    else
      return -1
    end
  end


end
