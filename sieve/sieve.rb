class Sieve
  attr_reader :numbers
  
  def initialize(range)
    @numbers = [*2..range]
  end
  
  def primes
    primes = [2]
    while numbers != []
      numbers.keep_if { |num| num % primes.last != 0 }
      primes << numbers.shift
    end
    primes
  end
end
