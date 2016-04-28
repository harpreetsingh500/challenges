class Cipher
  attr_reader :key
  KEYS = [*'a'..'z'].map.with_index { |char, idx| [char, idx] }.to_h
          
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
    text.split('').map.with_index do |char, index|
      value = KEYS[char] - KEYS[key[index]]
      (value < 0) ? KEYS.to_a[value].first : KEYS.key(value)
    end.join
  end
end
