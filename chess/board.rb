require_relative 'piece'

class Board
  attr_reader :grid
  def initialize(grid=Array.new(8) {Array.new(8)})
    @grid = grid 
    setup_default_grid
  end

  private
  def [](pos)
    x,y = pos 
    @grid[x][y]
  end

  def []=(pos, val)
    x,y = pos 
    @grid[x][y] = val 
  end

  def setup_default_grid
    @grid.each_with_index do |row, idx|
      case idx 
      when 0, 1, 6, 7
        row.each_index do |col|
          grid[idx][col] = Piece.new 
        end
      else
        row.each_index do |col|
          grid[idx][col] = NullPiece.new 
        end
      end 
    end
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new 
  p board
end