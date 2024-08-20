require_relative 'guess'

class Board
  attr_accessor :board

  def initialize
    12.times{
      create_board
    }
    self.board += "---------------------\n"
  end

  def create_board
    if self.board.nil?
      self.board = "---------------------\n#{Guess.new.choice}"
    else
      self.board += Guess.new.choice
    end
  end

end