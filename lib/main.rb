$LOAD_PATH << '.'
require('board')
require('game')
require('player')

def main
  loop do
    puts welcome_screen

    print "Please enter the dimension of the table [default: 3 (3 means 3x3)]: "
    dimension = gets.strip.to_i

    player_name1 = setup_player(1, Player::PLAYER1_DEFAULT_NAME)

    player_name2 = setup_player(2, Player::PLAYER2_DEFAULT_NAME)

    game = Game.new(dimension, player_name1, Player::PLAYER1_DEFAULT_SYMBOL, player_name2, Player::PLAYER2_DEFAULT_SYMBOL)

    on_game = true
    play_again = true

    print_table(game.board)

    while on_game

      next_move = setup_move(game.player_on_turn, game.board)
      game.make_a_move(next_move)

      system("cls") || system("clear")

      print_table(game.board)
      game_status = game.status

      if game_status == Board::WIN
        puts "#{game.player_on_turn.name} you won!!"
        on_game = false
      elsif game_status == Board::DRAW
        puts "Sorry none of you won"
        on_game = false
      else
        game.change_player
      end
    end

    print 'Do you want to play again? (y/n) [default: n]: '
    play_again = gets.chomp.downcase.match(/y|yes/) ? true : false
    on_game = true if play_again
    system("cls") || system("clear") if play_again
    break unless play_again
  end
  puts "Thanks for play this game!"
end

def welcome_screen
  welcome = "WELCOME TO THE TIC TAC TOE GAME!"
  welcome = "*"*welcome.length + "\n" + welcome + "\n" + "*"*welcome.length
end

def setup_player(num_of_player, name)
  print "Please insert the name of the player #{num_of_player}: "
  player_name = gets.strip.capitalize
  player_name = player_name == "" ? name : player_name

  return player_name
end

def setup_move(player, board)
  begin
    puts "Enter the value from 1 to #{board.size**2}"
    print "#{player.name} your turn: "
    next_move = gets.match(/\d+/)[0].to_i
    raise "Please enter a number in the range." unless (next_move).between?(1, board.size**2)
    raise "Please select an empty position." unless board.read_cell(next_move)
  rescue NoMethodError
    puts "Please enter only numeric values"
    retry
  rescue RuntimeError => e
    puts "#{e}"
    retry
  else
    return next_move
  end
end

def print_table(board)
  puts "TABLE GUIDE"
  puts board.table_guide
  puts "*" * ((board.size * board.size).to_s.length * board.size + board.size)
  puts "TABLE GAME"
  puts board.graphic_table
end

main
