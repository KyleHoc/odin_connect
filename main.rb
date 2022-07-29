require './slot'
require './board'
require './player'

def play_game()
    my_board = Board.new()
    player_one = Player.new()
    player_two = Player.new()

    player_one.assign_p1
    player_two.assign_p2(player_one)

    p1_win = false
    p2_win = false

    my_board.print_board

    while !p1_win && !p2_win
      my_board.make_move(player_one)
      my_board.print_board
      p1_win = my_board.check_victory(player_one)
      if p1_win == false
        my_board.make_move(player_two)
        my_board.print_board
        p2_win = my_board.check_victory(player_two)
      end
    end
    if p1_win
        player_one.print_message
    else
        player_two.print_message
    end
end

play_game()