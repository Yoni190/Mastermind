# Class for code maker player
class CodeMaker
  attr_accessor :chosen_colors, :player_mode

  @@colors = %w[red blue green yellow magenta cyan]

  def initialize(mode)
    self.player_mode = mode
    return unless player_mode == "cb"

    choose_four_colors
  end

  def choose_four_colors
    self.chosen_colors = @@colors.sample(4)
  end

  def player_choose_colors
    self.chosen_colors = gets.chomp.split
  end
end
