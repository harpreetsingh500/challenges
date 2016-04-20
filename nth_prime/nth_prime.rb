class Prime
  def self.nth(number)
    raise ArgumentError if number == 0
    prime_numbers = [2]
    num = 3
    while (prime_numbers.length != number)
      prime_numbers << num if prime?(num)
      num += 2
    end
    prime_numbers.last
  end
  
  def self.prime?(num)
    max = Math.sqrt(num).to_i
    max.times do |num_2|
      return false if (num % (num_2 + 2) == 0)  
    end
    true
  end
end
