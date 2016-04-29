class Series
  attr_reader :num
  
  def initialize(num)
    @num = num.split('').map(&:to_i)
  end
  
  def slices(amount)
    raise ArgumentError if num.length < amount
    num.map.with_index do |_, idx|
      num[idx, amount]
    end.keep_if { |arr| arr.length == amount }
  end
end
