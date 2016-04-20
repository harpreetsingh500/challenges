class WordProblem
  attr_reader :word_prob
  
  def initialize(word_prob)
    @word_prob = word_prob.sub('?', '')
    convert_word_prob_to_array
  end
  
  def convert_word_prob_to_array
    @word_prob = word_prob.split(' ').map do |word|
      if is_word_operator?(word)
        convert_word_to_operator(word)
      elsif (word == word.to_i.to_s)
        word.to_i
      else
        nil
      end
    end
    word_prob.delete(nil)
  end
  
  def is_word_operator?(word)
    (word == 'plus') || (word == 'minus') || (word == 'multiplied') || (word == 'divided')
  end
  
  def convert_word_to_operator(word)
    case word
    when 'plus' then '+'
    when 'minus' then '-'
    when 'multiplied' then '*'
    when 'divided' then '/'
    end
  end
  
  def answer
    raise ArgumentError if word_prob.length < 3
    length = word_prob.length / 2
    length.times do
      @word_prob[0..2] = word_prob[0].send word_prob[1], word_prob[2]
    end
    word_prob[0]
  end
end
