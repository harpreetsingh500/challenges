class Octal
  VALID_CHOICES = [*'0'..'7']
  attr_accessor :num
  
  def initialize(num)
    @num = num
  end
  
  def to_decimal
    total_sum = 0
    power = 0
    num.split(//).reverse.each do |digit|
      return 0 if !(VALID_CHOICES.include?(digit))
      total_sum += digit.to_i * (8 ** power)
      power += 1
    end
    total_sum
  end
end
