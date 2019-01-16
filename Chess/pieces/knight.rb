require_relative 'piece'
require_relative '../modules/steppable'

class Knight < Piece
    include Steppable

    def piece
        ' ♞ '
    end

    def move_diffs 
        [[-1, -2], [-1, 2], [1, -2], [1, 2],
         [-2, -1], [-2, 1], [2, -1], [2, 1]]
    end


  
end 