require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/pawn'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/null_piece'
require_relative 'errors'

class Board 
        
  
    attr_reader :grid

    def initialize
       fill_board
    end

    def []=(pos, piece)
        x,y = pos
        grid[x][y] = piece
    end 

    def [](pos)
        x,y = pos
        grid[x][y]
    end 

    def move_piece(start_pos, end_pos)
        raise NoPieceError unless self[start_pos]
        raise OffBoardError unless valid_move?(end_pos)
        return false unless self[start_pos].moves.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
    end 

    def valid_move?(pos)
        pos.all?{|x| (0..7).include?(x)}
    end

    def in_check?(color)

    end

    private

    def set_unfilled_board
        @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    end

    def fill_board
        set_unfilled_board
        set_pawn_rows
        set_outside_rows
    end 

    def set_pawn_rows
        [1, 6].each do |row|
            (0..7).each do |col|
                color = (row == 1 ? :black : :white)
                @grid[row][col] = Pawn.new(color, self, [row, col])
            end
        end 
    end 

    def set_outside_rows
        [0, 7].each do |row|
            next_col = (0..7).each
            color = (row == 0 ? :black : :white)
            [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each do |piece|
                @grid[row][next_col.peek] = piece.new(color, self, [row, next_col.next]) 
            end 
        end
    end

end 