require_relative 'piece'
require_relative '../modules/steppable'

class King < Piece 
    include Steppable

    def piece
        '♚'
    end
end 