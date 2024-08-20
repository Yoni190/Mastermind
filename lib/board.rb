require_relative 'guess'

class Board
  attr_accessor :board

  def initialize
    12.times{
      self.board.nil? ? self.board = Guess.new.choice : self.board += Guess.new.choice
    }
  end

end