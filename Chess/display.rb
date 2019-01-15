require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], @board)
    end

    def render
        system('clear')
        @board.grid.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                if [i, j] == @cursor.cursor_pos
                    print piece.to_s.colorize(:red)
                else
                    print piece.to_s
                end
            end
            puts
        end
        nil
    end
end