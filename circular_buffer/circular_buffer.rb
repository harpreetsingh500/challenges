class CircularBuffer
  attr_accessor :buffer, :buffer_length
  
  def initialize(buffer_length)
    @buffer = []
    @buffer_length = buffer_length
  end
  
  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end
  
  def write(value)
    raise BufferFullException if buffer.length == buffer_length
    buffer << value if value != nil
  end
  
  def write!(value)
    if value != nil
      if buffer.length < buffer_length
        write(value)
      else  
        read
        write(value)
      end
    end
  end
  
  def clear
    self.buffer = []
  end
  
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
  
end
