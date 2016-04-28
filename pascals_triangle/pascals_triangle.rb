class Triangle
  attr_reader :num
  
  def initialize(num)
    @num = num
  end
  
  def rows
    triangle = [[1]]
    counter = 2
    while triangle.length != num
      array = [1]
      (counter - 2).times do |idx|
        array << triangle[counter - 2][idx] + triangle[counter - 2][idx + 1]
      end
      triangle << (array << 1)
      counter += 1
    end
    triangle
  end
end
