# initialize both players
# generate some questions
# ask question to player 1
# update lives
# ask question to player 2
# update lives
# repeat until a player has 0 lives
# then end game

require './player'
require './question'

class Game

  def initialize
    @turn = 0
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @currentPlayer = ""
    @question = Question.new
    @running = true
    @Newturn = "------ NEW TURN ------"
    @Gameover = "------ GAME OVER ------"
  end

  attr_accessor :turn, :player1, :player2, :question, :newturn, :gameover

  def start_game
    puts "Math game start!"
    while @running
      puts "#{@Newturn}"
      game_turn
    end
    puts "#{@Gameover}"
    puts "Good bye!"
  end

  def score_card
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def get_player_answer
    print "> "
    answer = gets.chomp.to_i
    if answer == @question.answer
      puts "#{@currentPlayer.name}: YES! You are correct."
      score_card
    else
      puts "#{@currentPlayer.name}: Seriously? No!"
      @currentPlayer.lives -= 1
      score_card
    end
  end 

  def game_turn
    @turn += 1
    if @turn % 2 == 0
      @currentPlayer = @player2
    else
      @currentPlayer = @player1
    end
    puts "#{@currentPlayer.name}: #{@question.prompt}"
    get_player_answer
    @question = Question.new
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      @running = false
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      @running = false
    end
  end
end