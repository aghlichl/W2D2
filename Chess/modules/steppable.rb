module Steppable
    def moves
        changed_pos = move_diffs.map { |pos_diff| [@pos.first+pos_diff.first, @pos.last+pos_diff.last] }
        valid_moves = changed_pos.select { |possible_move| @board.valid_move?(possible_move) }
        not_here = valid_moves.reject { |pos| @board[pos].color == color}
    end
end 