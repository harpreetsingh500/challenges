class School
  attr_accessor :school
  
  def initialize
    @school = Hash.new([])
  end
  
  def add(name, grade)
    if school.has_key?(grade)
      school[grade] << name
    else
      school[grade] = [name]
    end
  end
  
  def to_h
    school.sort.map { |grade, names| [grade, names.sort] }.to_h
  end
  
  def grade(value)
    school[value]
  end
end
