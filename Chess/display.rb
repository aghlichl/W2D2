require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], @board)
    end

    # REFACTOR
    def render
        system('clear')
        @board.grid.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                tile_color = i + j
                if [i, j] == @cursor.cursor_pos
                    if @cursor.selected_position == [i, j]
                        print piece.to_s.colorize(:color => :green, :background => :red)
                    else
                        print piece.to_s.colorize(:background => :red)
                    end
                else
                    if @cursor.selected_position == [i, j]
                        print piece.to_s.colorize(:color => :green, :background => :yellow)
                    elsif color_moves(i, j, piece)
                    else
                        if tile_color.even?
                            print piece.to_s.colorize(:background => :light_blue)
                        else
                            print piece.to_s
                        end
                    end
                end
            end
            puts
        end
        nil
    end

    def run
        positions = []
        while true
            render
            possible_position = @cursor.get_input
            positions << possible_position if possible_position
            if positions.length == 2
                @board.move_piece(positions.first, positions.last)
                positions = []
            end
        end
    end

    private

    def color_moves(i, j, piece)
        if @cursor.selected_position
            selected_piece_moves = @board[@cursor.selected_position].moves
            if selected_piece_moves.include?([i, j])
                print piece.to_s.colorize(:background => :green)
                true
            end
        end
    end
end