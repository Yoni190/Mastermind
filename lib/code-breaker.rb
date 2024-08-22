class CodeBreaker
  attr_accessor :score, :code_breaker_guess

  def initialize
    self.score = 0
  end

  def increment_score
    self.score += 1
  end

  def make_a_guess
    self.code_breaker_guess = gets.chomp.split
  end
end