class CodeBreaker
  attr_accessor :score, :code_breaker_guess, :player_mode
  @@colors = ["red", "blue", "green", "yellow", "magenta", "cyan"]

  def initialize
    self.score = 0
  end


  def increment_score
    self.score += 1
  end

  def make_a_guess
    if(player_mode == "cb")
      self.code_breaker_guess = gets.chomp.split
    end
  end

  def break_the_code
    self.code_breaker_guess = @@colors.sample(4)
  end
end