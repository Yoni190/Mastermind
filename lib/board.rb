require_relative 'guess'

class Board
  attr_accessor :board

  def initialize
    board = ""
    12.times{
      board += Guess.new
    }
  end

