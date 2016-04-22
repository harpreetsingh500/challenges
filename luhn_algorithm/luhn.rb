class Luhn
  attr_reader :number
  
  def initialize(number)
    @number = number
    number_to_array
  end
  
  def number_to_array
    @number = number.to_s.reverse.split('').map(&:to_i)  
  end
  
  def self.create(num)
    new = Luhn.new(num)
    digit = 0
    while !(new.valid?)
      new.add(digit)
      digit += 1
      new.number.shift if !(new.valid?)
    end
    new.number.reverse.join.to_i
  end
  
  def add(digit)
    number.insert(0, digit)
  end
  
  def addends
    number.map.with_index do |num, index|
      double?(num, index)
    end.reverse
  end
  
  def double?(num, index)
    return double(num) if index.odd?
    num
  end
  
  def double(num)
    double_value = num * 2
    double_value >= 10 ? double_value - 9 : double_value
  end
  
  def checksum
    addends.reduce(:+)
  end
  
  def valid?
    checksum.to_s[-1] == '0'
  end
end
