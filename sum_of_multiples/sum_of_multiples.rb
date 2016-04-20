class SumOfMultiples
  attr_reader :multiples
  
  def initialize(*multiples)
    @multiples = multiples
  end
  
  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end
  
  def to(num)
    calculate(num)
  end
  
  def multiple?(num)
    multiples.any? { |multiple| num % multiple == 0 }
  end
  
  def calculate(number)
    total = [0]
    1.upto(number - 1) do |num|
      total << num if multiple?(num)
    end
    total.reduce(:+)
  end
end
