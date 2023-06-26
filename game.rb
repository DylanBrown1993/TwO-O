class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def start_game
    while (@player1.lives > 0) && (@player2.lives > 0)
      generate_question
      display_scores
      prompt_for_answer
      check_answer
      switch_player
    end

    announce_winner
  end

  private

  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def display_scores
    puts "---- Current Scores ----"
    puts "#{@player1.name}: #{@player1.score}"
    puts "#{@player2.name}: #{@player2.score}"
    puts "------------------------"
  end

  def prompt_for_answer
    print "#{current_player.name}, what is #{@num1} + #{@num2}? "
    @answer = gets.chomp.to_i
  end

  def check_answer
    if @answer == (@num1 + @num2)
      puts "Correct answer!"
      current_player.increase_score
    else
      puts "Wrong answer!"
      current_player.decrease_lives
    end
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def announce_winner
    winner = (@player1.lives == 0) ? @player2 : @player1
    puts "Game over! #{winner.name} wins with a score of #{winner.score}."
    puts "Better luck next time, #{winner == @player1 ? @player2.name : @player1.name}!"
  end
end
