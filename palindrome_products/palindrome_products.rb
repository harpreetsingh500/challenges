class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes
  
  def initialize(args)
    @max_factor = args.fetch(:max_factor, 1)
    @min_factor = args.fetch(:min_factor, 1)
    @palindromes = Hash.new([])
  end
  
  def generate
    min_factor.upto(max_factor) do |num|
      num.upto(max_factor) do |num_2|
        if valid_palindrome_number?(num, num_2)
          next if factor_exists?(num, num_2)
          @palindromes[num * num_2] += [[num, num_2]]
        end
      end
    end
    palindromes
  end
  
  def factor_exists?(num, num_2)
    palindromes[num * num_2].include?([num, num_2].sort)
  end
  
  def valid_palindrome_number?(num, num_2)
    (num * num_2).to_s.reverse == (num * num_2).to_s    
  end
  
  def largest
    value = palindromes.keys.sort.last
    PalindromeNumber.new(value, palindromes[value])
  end
  
  def smallest
    value = palindromes.keys.sort.first
    PalindromeNumber.new(value, palindromes[value])
  end
end

class PalindromeNumber
  attr_reader :value, :factors
  
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
