require_relative "guess"
require_relative "game"
require "colorize"

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
      if code_maker.include?(code_breaker[i]) && code_maker[i] == code_breaker[i]
        board.sub!("`", "O".colorize(:black))
        self.black += 1
        correctly_guessed[i] = code_breaker[i]
      elsif code_maker.include?(code_breaker[i])
        board.sub!("`", "O")
        self.white += 1
        correctly_guessed.delete_at(i)
      elsif !code_maker.include?(code_breaker[i])
        correctly_guessed.delete_at(i)
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
