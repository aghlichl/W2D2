require 'colorize'

class Piece
    def initialize(color)
        @color = color 
    end 

    def to_s
        color == :black ? piece.colorize(:black) : piece.colorize(:blue)
    end
    
    protected
    attr_reader :color
end



