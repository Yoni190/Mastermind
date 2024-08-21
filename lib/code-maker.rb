class CodeMaker
  attr_accessor :random
  @@colors = ["red", "blue", "green", "yellow", "purple", "brown"]

  def initialize
    choose_four_colors(self.random)
  end

  def choose_four_colors(array)
    array.push(sample(4))
  end
end