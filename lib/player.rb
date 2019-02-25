# class player
class Player
  attr_accessor :value, :symbol, :name
  
  PLAYER1_DEFAULT_SYMBOL = 'X'
  PLAYER1_DEFAULT_NAME = 'Player 1'
  PLAYER2_DEFAULT_SYMBOL = 'O'
  PLAYER2_DEFAULT_NAME = 'Player 2'

  def initialize(name, symbol)
    @symbol = symbol
    @name = name
    @value = nil
  end

  def play(value)
    @value = value
  end
end
