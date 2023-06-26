class Player
  attr_reader :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def decrease_lives
    @lives -= 1
  end

  def increase_score
    @score += 1
  end
end
