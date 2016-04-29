class Queens
  attr_reader :white, :black, :board
  
  def initialize(args = {})
    @white = args.fetch(:white, [0, 3])
    @black = args.fetch(:black, [7, 3])
    raise ArgumentError if white == black
    create_board
  end
  
  def to_s
    board.map { |row| row[0].split('').join(' ') }.join("\n")
  end
  
  def attack?
    (row_attack?) || (column_attack?) || (diagonal_attack?)
  end
  
  private
  
  def create_board
    @board = []
    8.times { self.board << ['________'] }
    board[white[0]][0][white[1]] = 'W'
    board[black[0]][0][black[1]] = 'B'
  end
  
  def row_attack?
    white[0] == black[0]
  end
  
  def column_attack?
    white[1] == black[1]
  end
  
  def diagonal_attack?
    check_diagonal(-1, 1) || check_diagonal(-1, -1) || check_diagonal(1, -1) || check_diagonal(1, 1)
  end
  
  def check_diagonal(x, y)
    row = white[0]
    column = white[1]
    while (row + x >= 0 && row + x <= 7) && (column + y >= 0 && column + y <= 7)
      return true if board[row + x][0][column + y] != '_'
      x > 0 ? x += 1 : x -= 1
      y > 0 ? y += 1 : y -= 1
    end
    false
  end
end
