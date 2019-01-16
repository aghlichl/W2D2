module Slidable 
    def moves
        moves = []
        move_dirs.each do |diff|
            moves += grow_unblocked_moves_in_dir(diff.first, diff.last)
        end
        moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        possible_move = [@pos.first + dx, @pos.last + dy]
        while @board.valid_move?(possible_move)
            current_piece = @board[[possible_move.first, possible_move.last]]
            if current_piece.is_a?(NullPiece)
                moves << possible_move
            elsif current_piece.color == @color
                break
            else
                moves << possible_move
                break
            end
            possible_move = [possible_move.first + dx, possible_move.last + dy]
        end
        moves
    end
end 