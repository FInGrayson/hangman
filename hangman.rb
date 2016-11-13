class Hangman
  def initialize(word)
    @word = word.split("")
    @hidden_word = ""
    @guess_limit = 5
    @guessed_words = {}
    word.length.times do
      @hidden_word = @hidden_word + "_"
    end
    "The game has begun: Here is the word #{@hidden_word}"
  end

  def check_letter(letter)
    if @guessed_words.has_key?(letter)
      "This letter has already been guessed."
    else
      if @word.include? letter
        add_letter(letter)
      else
        subtract_point(letter)
      end
    end
  end

  def add_letter(letter)
    @guessed_words[letter] = true
    hidden_index = 0
    @word.each do |x|
      if x === letter
        @hidden_word[hidden_index] = letter
        hidden_index += 1
      else
        hidden_index += 1
      end
    end
    game_status
  end

  def subtract_point(letter)
    @guessed_words[letter] = false
    @guess_limit -= 1
    game_status
  end

  def game_status
    if @guess_limit === 0
      message = "You lost! Here is the correct answer: #{@word.join('')}"
    elsif !@hidden_word.include? "_"
      message = "You Won!!! Congratulations on guessing #{@word.join('')}"
    else
      message = "You have #{@guess_limit} guess/es left. " +
      "Here is what you have so far: #{@hidden_word}"
    end
    return message, @guessed_words
  end
end
