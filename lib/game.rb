require_relative 'board'

class Game
  attr_accessor :game_board, :player_guess

  def initialize
    greet_player
    self.game_board = Board.new
    puts game_board.board

    prompt_player

    game_board.add_player_color(player_guess)
  end

  def greet_player
    puts "\t\s\s-----------------------------\n
          |  Welcome to Mastermind!   |\n
          -----------------------------\n\n"
  end

  def prompt_player
    puts "Hello, player. Please guess 4 random colors(put spaces between them)"
    self.player_guess = gets.chomp.split
  end

  def clear_screen
    puts "\e[1;1H\e[2J"
  end
end