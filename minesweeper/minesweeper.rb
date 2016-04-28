class ValueError < Exception; end  

class Board
  BOMB = '*'
  
  def self.transform(inp)
    check_for_error(inp)
    design = [inp.shift, inp.pop]
    @@inp = inp
    inp.map!.with_index do |section, idx_1|
      change(section, idx_1)
    end
    inp.unshift(design[0])
    inp << design[1]
  end
  
  def self.check_for_error(inp)
    raise ValueError if inp[0] != inp[0]
    inp.each { |section|  raise ValueError if section[0] != section[-1] }
    raise ValueError if inp.map(&:length)[1..-2].uniq.length != 1
    inp[1..-2].each { |section| raise ValueError if section =~ /[^*|\s]/ }
  end
  
  def self.change(section, idx_1)
    section.split('').map.with_index do |char, idx_2|
      total_bombs = 0
      if char == BOMB || char == '|'
        char
      else
        total_bombs += check_horizontally(idx_1, idx_2)
        total_bombs += check_vertically(idx_1, idx_2)
        total_bombs += check_diagonally(idx_1, idx_2)
        total_bombs == 0 ? ' ' : total_bombs
      end
    end.join
  end
  
  def self.check_horizontally(idx_1, idx_2)
    total_bombs = 0
    total_bombs += @@inp[idx_1][idx_2 + 1] == BOMB ? 1 : 0
    total_bombs += @@inp[idx_1][idx_2 - 1] == BOMB ? 1 : 0
  end
  
  def self.check_vertically(idx_1, idx_2)
    total_bombs = 0
    total_bombs += (@@inp[idx_1 + 1][idx_2] == BOMB ? 1 : 0) if @@inp[idx_1 + 1] != nil
    total_bombs += (@@inp[idx_1 - 1][idx_2] == BOMB ? 1 : 0) if idx_1 != 0
    total_bombs
  end
  
  def self.check_diagonally(idx_1, idx_2)
    total_bombs = 0
    total_bombs += (@@inp[idx_1 + 1][idx_2 + 1] == BOMB ? 1 : 0) if @@inp[idx_1 + 1] != nil
    total_bombs += (@@inp[idx_1 + 1][idx_2 - 1] == BOMB ? 1 : 0) if @@inp[idx_1 + 1] != nil
    total_bombs += (@@inp[idx_1 - 1][idx_2 + 1] == BOMB ? 1 : 0) if idx_1 != 0
    total_bombs += (@@inp[idx_1 - 1][idx_2 - 1] == BOMB ? 1 : 0) if idx_1 != 0
    total_bombs
  end
end
