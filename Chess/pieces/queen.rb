require_relative 'piece'
require_relative '../modules/slidable' 

class Queen < Piece
    include Slidable

    def piece
        '♛'
    end
end 