require_relative 'card'
require 'byebug'
class Board
    
    attr_reader :n, :gird
    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n, nil)}
        self.populate
    end

    def populate
        cards = (0...n*n/2).to_a * 2
        cards.shuffle!
        
        @grid.each_index do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = Card.new(cards.pop)
            end
        end
    end

    def render
        @grid.each {|row| p row.map(&:to_s).join(',')}    
    end

    def won?
        @grid.all? do |row|
            row.all? {|cell| cell.face_up}
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def reveal(guessed_pos)
        self[guessed_pos].reveal if !self[guessed_pos].face_up
    end

end


# b = Board.new(4)
# b.populate
# b.reveal([1,2])
# b.render
