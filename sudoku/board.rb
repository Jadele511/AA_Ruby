require_relative 'tile'
require 'pp'

class Board

    attr_accessor :grid
    def self.from_file(filename)
        tmp = Array.new(9) {Array.new(9, Tile.new(0))}
        File.open(fromfile, 'r').each_line.with_index do |line, i|
            line.chomp.split('').each_index do |j|
                tmp[i][j] = Tile.new(line[j])
            end
        end
        tmp
    end
    
    def initialize(filename)
        @grid = Board.from_file(filename)
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col].value = value
    end

    def render
        @grid.each {|row| p row}
    end

    def rows_solved?
        @grid.all? do |row|
            tiles = row.map(&:value)
            tiles.uniq.length == 9 && !tiles.uniq.include?(0)
        end

    end

    def cols_solved?
        @grid.transpose.all? do |col|
            tiles = col.map(&:value)
            tiles.uniq.length == 9 && !tiles.uniq.include?(0)
        end
    end

    def each_sub_solved?(start_row, end_row, start_col, end_col)
        tiles = []
        (start_row...end_row).each do |i|
            (start_col...end_col).each do |j|
                tiles << @grid[i][j].value
            end
        end
        tiles.uniq.length == 9 && !tiles.uniq.include?(0)
    end

    def subs_solved?
        res = []
        res << each_sub_solved?(0, 3, 0, 3)
        res << each_sub_solved?(0, 3, 3, 6)
        res << each_sub_solved?(0, 3, 6, 9)
        res << each_sub_solved?(3, 6, 0, 3)
        res << each_sub_solved?(3, 6, 3, 6)
        res << each_sub_solved?(3, 6, 6, 9)
        res << each_sub_solved?(6, 9, 0, 3)
        res << each_sub_solved?(6, 9, 3, 6)
        res << each_sub_solved?(6, 9, 6, 9)

        res.uniq.length == 1 && res.uniq[0] == true

    end

    def solved?
        rows_solved? && cols_solved? && subs_solved?
    end
    
end
