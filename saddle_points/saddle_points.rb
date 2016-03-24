class Matrix
  attr_accessor :matrix
  
  def initialize(matrix)
    @matrix = matrix
    convert_str_matrix_to_num_matrix
  end
  
  def convert_str_matrix_to_num_matrix
    self.matrix = matrix.split("\n")
    matrix.map! { |str| str.split(' ').map(&:to_i) }
  end
  
  def rows
    matrix
  end
  
  def columns
    columns_arr = []
    length_1 = matrix[0].length
    length_2 = matrix.length
    index_2 = 0
    length_1.times do
      empty_arr = []
      length_2.times do |index_1|
        empty_arr << matrix[index_1][index_2]
      end
    index_2 += 1
    columns_arr << empty_arr
    end
    columns_arr
  end
  
  def saddle_points
    points = []
    matrix.each_with_index do |arr, index|
      max_value = arr.max
      index_of_max_value = arr.index(max_value)
      min_value = columns[index_of_max_value].min
      if min_value == max_value
        points << [index, index_of_max_value]
      end
    end
    points
  end
end
