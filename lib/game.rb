require_relative 'board'
require_relative 'code-maker'
require_relative 'code-breaker'

class Game
  attr_accessor :game_board, :player_guess, :cm, :cb, :mode
  @@cb = CodeBreaker.new

  def initialize
    self.game_board = Board.new
    self.cm = CodeMaker.new
    greet_player
    ask_mode

    12.times do 
      play_round(game_board)
      if win?
        puts game_board.board
        puts "Congrats. You broke the code!"
        @@cb.increment_score
        break
      else
        game_board.check_guess(@@cb.code_breaker_guess, cm.random)
      end
    end

    if continue?
      Game.new
    end
    
  end

  def ask_mode
    puts "Do you want to be a Code breaker or Code Maker?(cb/cm)"
    self.mode = gets.chomp
  end

  def play_round(game_board)
    greet_player
    display_score
    puts game_board.board
    prompt_player
    @@cb.make_a_guess
    game_board.add_player_color(@@cb.code_breaker_guess)
    clear_screen
  end

  def greet_player
    puts "\t\s\s-------------------------------------------------------\n
          | \t\t Welcome to Mastermind!   \t\t|\n
          | \tYou can choose any of the following colors: \t|\n
          | \t\s\sred, blue, green, yellow, magenta, cyan \s\s\t|\n
          -------------------------------------------------------\n\n"
  end

  def display_score
    puts "Codes broken: #{@@cb.score}\n"
  end

  def prompt_player
    puts "Hello, player. Please guess 4 random colors(put spaces between them)"
  end

  def clear_screen
    puts "\e[1;1H\e[2J"
  end

  def win?
    @@cb.code_breaker_guess == cm.random ? true : false
  end

  def continue?
    puts "Continue?[Y/N]"
    gets.chomp == "Y" ? true : false
  end

  
end