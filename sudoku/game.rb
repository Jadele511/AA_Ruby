require_relative 'tile'
require_relative 'board'

class Game

    attr_accessor :board, :player_name
    def initialize
        @board = Board.new
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            p "Enter a position with coordinates separated with a space like `4 7`"
            pos = gets.chomp.split.map do |ch|
                if ch.to_i.to_s != ch
                    raise "position should be 2 numbers"
                else
                    ch.to_i
                end
            end
            raise "There should be 2 numbers or one space only" if pos.length != 2
            p 'Position is not legal, please enter new position' if !legal_positions.include?(pos)
        end
        pos
    end

    def legal_positions
        res = []
        (0...9).each do |i|
            (0...9).each do |j|
                pos = [i, j]
                res << pos if @board[pos].value == 0 || !@board[pos].given
            end
        end
        res
    end

    def get_value
        val = nil
        until val && valid_value?(val)
            p 'Enter a number from 1 to 9 (0 to clear the tile)'
            val = gets.chomp.to_i
        end
        val
    end
     
    def valid_value?(val)
        val.is_a?(Integer) && (0..9).to_a.include?(val)
    end

    def play
        @board.render
        begin
            pos = get_position(legal_positions)
            val = get_value
            @board[pos] = val
            @board.render
        end until @board.solved?
        @board.render
        p 'You won'
    end
end

g = Game.new
p g.play