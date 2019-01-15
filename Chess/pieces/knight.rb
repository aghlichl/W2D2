require_relative 'piece'
require_relative '../modules/steppable'

class Knight < Piece
    include Steppable

    def piece
        '♞'
    end
end 