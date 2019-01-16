require_relative 'piece'
require_relative '../modules/steppable'

class King < Piece 
    include Steppable

    def piece
        ' ♚ '
    end

    private 

    def move_diffs 
        [[1, 0], [-1, 0], [-1, 1], [1, -1],
         [0, -1], [0, 1], [-1, -1], [1, 1]]
    end 
end 