class SecretHandshake
  HANDSHAKE_CODES = ['wink', 'double blink', 'close your eyes', 'jump'].freeze
  
  def initialize(value)
    @binary = value
  end
  
  def convert_to_binary
    @binary = @binary.to_s(2) rescue (@binary = [])
    return @binary if @binary == []
    
    @binary = @binary.split('').reverse.map(&:to_i)    
  end
  
  def commands
    convert_to_binary
    handshake = []
    
    @binary.each_with_index do |binary, index|
      break if index == 4
      if binary == 1
        handshake << HANDSHAKE_CODES[index]
      end
    end
    
    if @binary[4] == 1
      handshake.reverse!
    end
    
    handshake
  end
end