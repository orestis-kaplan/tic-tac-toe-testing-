require './lib/game'
require './lib/board'

# We had a conversation about the behavior of code that should be tested
# For example it should simulate the program flow ,so call functions to have the
# simulation of the program running(behavior 1) or to test specific functions with specific testcases
# and see the worst case scenarios that a function can achieve so that we can have a behavior like that (behavior 2) (see lines 56 -57)?

describe Board do
  describe "allows to initialize the size of the board" do
    it "returns a board of 3x3" do
      dimension = 0
      board = Board.new(dimension)
      expect(board.size).to eql(3)
    end
  end
  describe "#check_rows" do
    it "returns WIN of rows" do
      board = Board.new(3)
      board.table = [['X','X','X'],[nil,nil,nil],[nil,nil,nil]]
  	  expect(board.check_rows).to eql(Board::WIN)
    end
  end
  describe "#check_columns" do
    it "return WIN of columns" do
      board = Board.new(3)
      board.table = [['X',nil,nil],['X',nil,nil],['X',nil,nil]]
      expect(board.check_columns).to eql(Board::WIN)
    end
  end
  describe "#check_main_diagonal" do
    it "return WIN of main_diagonal" do
      board = Board.new(3)
      board.table = [['X',nil,nil],[nil,'X',nil],[nil,nil,'X']]
      expect(board.check_main_diagonal).to eql(Board::WIN)
    end
  end
  describe "#check_second_diagonal" do
    it "return WIN of check_second_diagonal" do
      board = Board.new(3)
      board.table = [[nil,nil,'X'],[nil,'X',nil],['X',nil,nil]]
      expect(board.check_second_diagonal).to eql(Board::WIN)
    end
  end
  describe "#draw" do
    it "return DRAW of draw" do
      board = Board.new(3)
      board.table = [['O','O','X'],['X','X','O'],['O','X','O']]
      expect(board.draw).to eql(Board::DRAW)
    end
  end
  describe "#read_cell" do
    it "Returns false if the position is filled and true if empty" do
      board = Board.new(3)
      board.table = [['X','X','X'],[nil,nil,nil],[nil,nil,nil]]
      #behavior 1 would be to add this line here board.fill_table(1,'X')
      # behavior 2 is not to add it
      expect(board.read_cell(1)).to eql(false)
    end
  end
end
