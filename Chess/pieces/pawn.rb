require_relative 'piece'
class Pawn < Piece
    def piece
        ' ♟ '
    end

    def moves
        move_diffs = if initial_move?
                       [forward_dir, forward_dir.map { |x| x * 2 }]
                     else
                        forward_dir
                     end
        changed_pos = move_diffs.map { |pos_diff| [@pos.first+pos_diff.first, @pos.last+pos_diff.last] }
        valid_moves = changed_pos.select { |possible_move| @board.valid_move?(possible_move) }
        not_here = valid_moves.reject { |pos| @board[pos].color == color}
    end

    def forward_dir
        @color == :black ? [1, 0] : [-1, 0]
    end

    private

    def initial_move?
        [1, 6].include?(@pos.first)
    end
end 
