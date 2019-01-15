require_relative 'piece'
require_relative '../modules/slidable'

class Rook < Piece 
    include Slidable

    def piece
        '♜'
    end
end 