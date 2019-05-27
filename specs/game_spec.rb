require('minitest/autorun')
require('minitest/rg')
require_relative('../models/game')

class TestGame < Minitest::Test

  def setup
    @game_p1_win1 = game = Game.new("rock", "scissors")
    @game_draw1 = game = Game.new("rock", "rock")
    @game_p2_win1 = game = Game.new("rock", "paper")
    @game_p2_win2 = game = Game.new("paper", "scissors")
    @game_p1_win2 = game = Game.new("paper", "rock")
    @game_draw2 = game = Game.new("paper", "paper")
    @game_draw3 = game = Game.new("scissors", "scissors")
    @game_p2_win3 = game = Game.new("scissors", "rock")
    @game_p1_win3 = game = Game.new("scissors", "paper")
  end

  def test_get_player_choices
    assert_equal("rock", @game_p1_win1.player1)
    assert_equal("scissors", @game_p1_win1.player2)
  end

  def test_compare_choices
    assert_equal(1, @game_p1_win1.compare_choices)
    assert_equal(1, @game_p1_win2.compare_choices)
    assert_equal(1, @game_p1_win3.compare_choices)
    assert_equal(0, @game_draw1.compare_choices)
    assert_equal(0, @game_draw2.compare_choices)
    assert_equal(0, @game_draw3.compare_choices)
    assert_equal(-1, @game_p2_win1.compare_choices)
    assert_equal(-1, @game_p2_win2.compare_choices)
    assert_equal(-1, @game_p2_win3.compare_choices)
  end

  
end
