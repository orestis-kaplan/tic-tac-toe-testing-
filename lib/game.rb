# game class
class Game

  attr_reader :board, :player_on_turn

  def initialize(board_dimension, player1_name, player1_sym, player2_name, player2_sym)
    @board = Board.new(board_dimension)
    @player1 = Player.new(player1_name, player1_sym)
    @player2 = Player.new(player2_name, player2_sym)
    @player_on_turn = @player1
  end

  def status

    rows_status = @board.check_rows
    return rows_status if rows_status == Board::WIN

    columns_status = @board.check_columns
    return columns_status if columns_status == Board::WIN

    main_diagonal_status = @board.check_main_diagonal
    return main_diagonal_status if main_diagonal_status == Board::WIN

    second_diagonal_status = @board.check_second_diagonal
    return second_diagonal_status if second_diagonal_status == Board::WIN

    draw_status = @board.draw
    return draw_status if draw_status == Board::DRAW
    
    
  end

  def make_a_move move
    @player1.play(move)
    @board.fill_table(@player1.value, @player1.symbol)
    @player1, @player2 = @player2, @player1
  end

  def change_player
    @player_on_turn = @player1
  end

end