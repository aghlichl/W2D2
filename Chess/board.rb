require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'
require_relative 'king'
require_relative 'queen'
require_relative 'null_piece'
require_relative 'errors'

class Board 
        
    def self.empty_board
        Array.new(8) { Array.new(8, nil) }
    end

    def self.filled_board
        empty_board = Board.empty_board
        empty_board[0], empty_board[-1] = Board.outside_row(:black), Board.outside_row(:blue)
        empty_board[1], empty_board[-2] = Board.pawn_row(:black), Board.pawn_row(:blue)
        empty_board
    end 

    def self.pawn_row(color)
        Array.new(8, Pawn.new(color))
    end 

    def self.outside_row(color)
        [Rook.new(color), Knight.new(color), Bishop.new(color), Queen.new(color), 
        King.new(color), Bishop.new(color), Knight.new(color), Rook.new(color)]
    end

    attr_reader :grid

    def initialize
        @grid = Board.filled_board
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
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end 

    private 

    def valid_move?(pos)
        pos.all?{|x| (0..7).include?(x)}
    end 



end 