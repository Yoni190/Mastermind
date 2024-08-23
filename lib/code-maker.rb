class CodeMaker
  attr_accessor :chosen_colors, :player_mode
  @@colors = ["red", "blue", "green", "yellow", "magenta", "cyan"]

  def initialize
    choose_four_colors
  end

  def choose_four_colors
    if player_mode == "cb"
      self.chosen_colors = @@colors.sample(4)
    elsif player_mode == "cm"
      self.chosen_colors = gets.chomp.split
    end
  end
end