class CodeBreaker
  attr_accessor :score, :code_breaker_guess, :player_mode

  @@colors = %w[red blue green yellow magenta cyan]

  def initialize
    self.score = 0
  end

  def increment_score
    self.score += 1
  end

  def make_a_guess
    self.code_breaker_guess = gets.chomp.split
  end

  def break_the_code
    if code_breaker_guess.nil? || code_breaker_guess.length == 4
      self.code_breaker_guess = @@colors.sample(4)
    else
      guees_length = code_breaker_guess.length
      code_breaker_guess.push(@@colors.sample(4 - guees_length)).flatten!
    end
  end
end
