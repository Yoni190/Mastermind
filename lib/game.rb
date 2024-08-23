require_relative "board"
require_relative "code_maker"
require_relative "code_breaker"

# Class that deals with the gameplay
class Game
  attr_accessor :game_board, :player_guess, :cm, :cb

  @@cb = CodeBreaker.new

  def initialize
    self.game_board = Board.new
    greet_player
    ask_mode

    if @@cb.player_mode == "cb"
      cb_mode

    elsif @@cb.player_mode == "cm"
      cm_mode
    end
    puts game_board.board unless win?

    return unless continue?

    Game.new
  end

  def cb_mode
    12.times do
      play_round(game_board)
      if win?
        puts game_board.board, "Congrats. You broke the code!"
        @@cb.increment_score
        break
      else
        game_board.check_guess(@@cb.code_breaker_guess, cm.chosen_colors)
      end
    end
  end

  def cm_mode
    ask_code_maker
    cm.player_choose_colors
    12.times do
      @@cb.break_the_code
      game_board.add_color(@@cb.code_breaker_guess)
      if win?
        puts game_board.board
        puts "The code has been broken. You failed your country"
        break
      else
        game_board.check_guess(@@cb.code_breaker_guess, cm.chosen_colors)
        @@cb.code_breaker_guess = game_board.correctly_guessed unless game_board.correctly_guessed.nil?
      end
    end
  end

  def ask_code_maker
    puts "What color codes do you want the computer to break?"
  end

  def ask_mode
    puts "Do you want to be a Code breaker or Code Maker?(cb/cm)"
    mode = gets.chomp
    @@cb.player_mode = mode
    self.cm = CodeMaker.new(mode)
  end

  def play_round(game_board)
    greet_player
    display_score
    puts game_board.board
    prompt_player
    @@cb.make_a_guess
    game_board.add_color(@@cb.code_breaker_guess)
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
    @@cb.code_breaker_guess == cm.chosen_colors
  end

  def continue?
    puts "Continue?[Y/N]"
    gets.chomp == "Y"
  end
end
