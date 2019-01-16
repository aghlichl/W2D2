require_relative 'piece'
require_relative '../modules/slidable'

class Bishop < Piece
    include Slidable
    
    def piece
        ' ♝ '
    end

    def move_dirs
        [[-1, 1], [1, 1], [1, -1], [-1, -1]]
    end
end 