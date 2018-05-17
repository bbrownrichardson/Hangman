=begin
Brianna Brown Richardson
Last Updated: 16 May 2018

Simple Hangman Game
=end

$words_to_choose =
    %w[queue protocols datagram boomboomboom sommers
         socket flood networking bandwidth frames
         segment handshake acknowledgment persistent
         bynres delay memory connectionless congestion
         dijkstra pipeline multiplexing visa fox packet]


class Hangman
  def initialize(selected_word)
    @selected_word = selected_word
    @selected_letter = Array.new
    @letters = Array.new
    @num_guesses = 0
    @max_guesses = 6
    word_setup
    begin_game
  end

  def word_setup
    @selected_word.split("").each do |x|
      @letters << x
      @selected_letter << '_'
    end
  end

  def begin_game
    puts @selected_letter.join(' ')
    until @letters.all? {|x| x == "_"}
      print "Guess a letter: "
      guess = gets.chomp.downcase

      exit if guess == "quit"

      if guess.length > 1
        puts "One character at a time please!\n\n"
      else
        @letters.include?(guess) ? correct_guess(guess) : incorrect_guess(guess)
      end

    end

    puts "Congratulations! You got it!"
    exit
  end

  def incorrect_guess(guess)
    if @num_guesses != 6
      puts "#{guess} is incorrect! Try Again!"
      puts "You have #{@max_guesses - @num_guesses} guesses left!\n\n"
      @num_guesses += 1
      puts @selected_letter.join(' ')
    else
      puts "#{guess} is incorrect. All out of guesses. Aww better luck next time"
      exit
    end
  end

  def correct_guess(guess)
    puts "Correct guess!"
    index = @letters.find_index(guess)
    @letters[index] = '_'
    @selected_letter[index] = guess

    print @selected_letter.join(" ")
    print "\n"
  end

end


def run_game
  Hangman.new($words_to_choose.sample)
end

run_game
