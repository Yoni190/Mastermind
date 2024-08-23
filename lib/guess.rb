# Class for creating a single guess place
class Guess
  attr_accessor :choice

  def initialize
    self.choice = "| o o o o | ` ` ` ` |\n"
  end
end
