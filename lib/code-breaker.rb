class CodeBreaker
  attr_accessor :score

  def initialize
    self.score = 0
  end

  def increment_score
    self.score += 1
  end
end