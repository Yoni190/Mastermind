require_relative 'board'

class Game
  attr_accessor :game_board

  def initialize
    self.game_board = Board.new
    puts game_board.board
  end
end