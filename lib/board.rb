require_relative 'guess'
require_relative 'game'
require 'colorize'

class Board
  attr_accessor :board, :black, :white

  def initialize
    12.times{
      create_board
    }
    self.board += "---------------------\n"
    self.black = 0
    self.white = 0
  end

  def create_board
    if self.board.nil?
      self.board = "---------------------\n#{Guess.new.choice}"
    else
      self.board += Guess.new.choice
    end
  end

  def add_color(array)
    array.each{|color| board.sub!("o", "O".colorize(color.to_sym))}
  end

  def check_guess(code_breaker, code_maker)
    i = 0
    while i < code_maker.length
      if code_maker.include?(code_breaker[i]) && code_maker[i] == code_breaker[i]
        board.sub!("`", "O".colorize(:black))
        self.black += 1
      elsif code_maker.include?(code_breaker[i])
        board.sub!("`", "O")
        self.white += 1
      end
      i += 1
    end
    j = 4
    while j > black + white
      board.sub!("`", "x")
      j -= 1
    end

    self.black = 0
    self.white = 0
  end


end