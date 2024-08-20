require_relative 'board'

class Game
  attr_accessor :game_board, :player_guess

  def initialize
    greet_player
    self.game_board = Board.new
    puts game_board.board

    prompt_player
  end

  def greet_player
    puts "\t\s\s-----------------------------\n
          |  Welcome to Mastermind!   |\n
          -----------------------------"
  end

  def prompt_player
    puts "Hello, player. Please guess 4 random colors(put spaces between them)"
    self.player_guess = gets.chomp.split
  end
end