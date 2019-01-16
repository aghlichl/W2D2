require 'colorize'

class Piece
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end

    def to_s
       piece.colorize(color)
    end

    def inspect
        "#{self.class}:#{@pos}-#{@color}"
    end
    
    protected
    attr_reader :color
end



