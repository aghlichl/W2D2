require_relative 'piece'
require_relative '../modules/slidable'

class Bishop < Piece
    include Slidable
    
    def piece
        '♝'
    end
end 