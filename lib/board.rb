require_relative "guess"
require_relative "game"
require "colorize"

# Class for displaying and updating the board
class Board
  attr_accessor :board, :black, :white, :correctly_guessed

  def initialize
    12.times do
      create_board
    end
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
    array.each { |color| board.sub!("o", "O".colorize(color.to_sym)) }
  end

  def check_guess(code_breaker, code_maker)
    i = 0
    self.correctly_guessed = code_breaker.map(&:clone)
    while i < code_maker.length
      check_black_and_white(code_breaker, code_maker, i)
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

  def check_black_and_white(code_breaker, code_maker, index)
    if code_maker.include?(code_breaker[index]) && code_maker[index] == code_breaker[index]
      board.sub!("`", "O".colorize(:black))
      self.black += 1
      correctly_guessed[index] = code_breaker[index]
    elsif code_maker.include?(code_breaker[index])
      board.sub!("`", "O")
      self.white += 1
      correctly_guessed.delete_at(index)
    else
      correctly_guessed.delete_at(index)
    end
  end
end
