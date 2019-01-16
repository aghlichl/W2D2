require_relative 'piece'
require_relative '../modules/slidable'

class Rook < Piece 
    include Slidable

    def piece
        ' ♜ '
    end

    def move_dirs
        [[1, 0], [-1, 0], [0, 1], [0, -1]]
    end
end 