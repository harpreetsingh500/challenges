class Cipher
  attr_reader :key
  KEYS = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4,
           'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9,
           'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13,
           'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17,
           's' => 18, 't' => 19, 'u' => 20, 'v' => 21,
           'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
  
  def initialize(key = nil)
    raise ArgumentError if check(key)
    @key = (key == nil) ? set(key) : key
  end
  
  def check(key)
    (key =~ /[A-Z]/) || (key =~ /\d+/) || (key == '')
  end
  
  def set(key)
    key = ''
    100.times { key << [*'a'..'z'].sample }
    key
  end
  
  def encode(text)
    text.split('').map.with_index do |char, index|
      move_amount = KEYS[key[index]]
      move_amount.times { char = char.next.chr }
      char
    end.join
  end
  
  def decode(text)
    
  end
end

test1 = Cipher.new
p test1.encode('abcdefghij')
p test1.key[0, 10]