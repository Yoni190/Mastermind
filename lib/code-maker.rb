class CodeMaker
  attr_accessor :chosen_colors
  @@colors = ["red", "blue", "green", "yellow", "magenta", "cyan"]

  def initialize
    choose_four_colors(self.random)
  end

  def choose_four_colors(random)
    self.chosen_colors = @@colors.sample(4)
  end
end