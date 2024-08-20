class Color
  attr_accessor :random_colors
  COLORS = ["red", "blue", "yellow", "brown", "green", "purple"]
  def initialize
    self.random_colors = []
    add_random_colors(random_colors)
  end

  def add_random_colors(array)
    array.push(COLORS.sample(4))
  end
end