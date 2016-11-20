require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize

  @game_over = false
  @seq = []
  @sequence_length = 1

  end

  def play
    puts "Ready to start? (y/n)"
    input = gets.chomp
    if input == "y"
    until @game_over
    take_turn
    end
    game_over_message
    reset_game
  end
  end

  def take_turn
    show_sequence
    system("clear")
    require_sequence
#    debugger
    unless @game_over
    round_success_message
    sleep(1)
    @sequence_length += 1
    end

  end

  def show_sequence
    system("clear")
    add_random_color
    @seq.each do |color|
      sleep(1)
      puts "    #{color}"
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
  #  debugger
    puts "What's your guess? (ex. red blue)"
    input = gets.chomp
    guess = parse_sequence(input)
    return @game_over = true unless guess == @seq
  end

  def parse_sequence(input)
    guess = input.split(" ")
  end

  def add_random_color
    @seq << COLORS.sample

  end

  def round_success_message
    system("clear")
    puts "You got it!"

  end

  def game_over_message
    puts "Game Over!"
    p @seq
  end

  def reset_game
  @seq = []
  @game_over = false
  @sequence_length = 1
  end

end
