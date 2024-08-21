require_relative 'board'
require_relative 'code-maker'

class Game
  attr_accessor :game_board, :player_guess, :cm

  def initialize
    self.game_board = Board.new
    self.cm = CodeMaker.new

    12.times do 
      play_round(game_board)
      if win?
        puts "Congrats. You broke the code!"
        break
      end
    end
    
  end

  def play_round(game_board)
    greet_player
    puts game_board.board
    prompt_player
    game_board.add_player_color(player_guess)
    clear_screen
  end

  def greet_player
    puts "\t\s\s-------------------------------------------------------\n
          | \t\t Welcome to Mastermind!   \t\t|\n
          | \tYou can choose any of the following colors: \t|\n
          | \t\s\sred, blue, green, yellow, magenta, cyan \s\s\t|\n
          -------------------------------------------------------\n\n"
  end

  def prompt_player
    puts "Hello, player. Please guess 4 random colors(put spaces between them)"
    self.player_guess = gets.chomp.split
  end

  def clear_screen
    puts "\e[1;1H\e[2J"
  end

  def win?
    player_guess == cm.random ? true : false
  end
end