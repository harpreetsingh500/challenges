class Triplet
  attr_reader :numbers
  
  def initialize(*numbers)
    @numbers = numbers
  end
  
  def self.where(args)
    @@max_factor = args.fetch(:max_factor, 1)
    @@min_factor = args.fetch(:min_factor, 1)
    @@sum = args.fetch(:sum, nil)
    generate_triplets
  end
  
  def self.generate_triplets
    combinations = [*@@min_factor..@@max_factor].combination(3).to_a
    combinations.map! { |array| new(array[0], array[1], array[2]) }
    combinations.select { |array| (array.sum == @@sum || @@sum == nil) && (array.pythagorean?) }
  end
  
  def sum
    numbers.reduce(:+)
  end
  
  def product
    numbers.reduce(:*)
  end
  
  def pythagorean?
    (numbers[0] ** 2) + (numbers[1] ** 2) == numbers[2] ** 2
  end
end
