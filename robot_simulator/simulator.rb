class Robot
  attr_accessor :direction, :x, :y
  DIRECTIONS = [:west, :north, :east, :south]
  
  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    @direction = direction
  end
  
  def bearing
    direction
  end
  
  def turn_right
    self.direction = new_direction[1]
  end
  
  def turn_left
    self.direction = new_direction[0]
  end
  
  def at(x, y)
    @x = x
    @y = y
  end
  
  def coordinates
    [x, y]
  end
  
  def advance
    case direction
    when :north then self.y += 1
    when :south then self.y -= 1
    when :west then self.x -= 1
    when :east then self.x += 1
    end
  end
  
  private
  
  def new_direction
    return [:west, :east] if direction == :north
    return [:north, :south] if direction == :east
    return [:east, :west] if direction == :south
    return [:south, :north] if direction == :west
  end
end

class Simulator < Robot
  INSTRUCTIONS = {'R' => :turn_right, 'L' => :turn_left, 'A' => :advance}
  
  def instructions(code)
    code.split('').map { |char| INSTRUCTIONS[char] }
  end
  
  def place(robot, options)
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end
  
  def evaluate(robot, commands)
    commands = instructions(commands)
    commands.each { |command| robot.send command }
  end
end
