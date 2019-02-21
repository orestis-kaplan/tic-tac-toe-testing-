require ('./lib/game')
require ('./lib/player')

describe Game do
  describe "make_a_move" do
    it "return the default name of the correct player in turn" do
      move = 2
      game = Game.new(3,Player::PLAYER1_DEFAULT_NAME,Player::PLAYER2_DEFAULT_NAME,'X','O')
      game.board.table = [['X','X','X'],[nil,nil,nil],[nil,nil,nil]]
      expect(game.player_on_turn.name).to eql(Player::PLAYER1_DEFAULT_NAME)
    end
  end
end
