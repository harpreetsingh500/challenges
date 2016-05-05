require 'pry'

class Crypto
  attr_reader :str
  
  def initialize(str)
    @str = str
  end
  
  def normalize_plaintext
    @str = str.gsub(/\W+/, '').downcase
  end
  
  def size
    normalize_plaintext
    square = Math.sqrt(str.length)
    return square.to_i if square == square.to_i
    square.ceil
  end
  
  def plaintext_segments
    line_size = size
    arr = str.split('')
    new_str = []
    arr.each_slice(line_size) do |word|
      new_str << word.join
    end
    new_str
  end
  
  def ciphertext(space = '')
    arr = plaintext_segments.map { |word| word.split('') }
    length1 = arr[0].length
    length2 = arr.length
    new_arr = []
    length1.times do |idx1|
      word = ''
      length2.times do |idx2|
        break if arr[idx2][idx1] == nil
        word << arr[idx2][idx1]
      end
      new_arr << word
    end
    new_arr.join(space)
  end
  
  def normalize_ciphertext
    ciphertext(' ')
  end
end
