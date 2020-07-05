require 'set'
$grid
$n
$col 
$left_diag
$right_diag
$result=[]


def print
    $grid.each {|row| p row.join('')}
    puts "\n"
end

def mark(row)
    begin
        $result << $grid.map(&:join)
        return
    end if row == $n 
    (0...$n).each do |i|
        left_diag_id = row - i
        right_diag_id = row + i
        if $col[i] && !$left_diag.include?(left_diag_id) && !$right_diag.include?(right_diag_id)
            $grid[row][i] = 'Q'
            $col[i] = false
            $left_diag << left_diag_id
            $right_diag << right_diag_id
            mark(row+1)
            $col[i] = true 
            $grid[row][i] = '.'
            $left_diag.delete(left_diag_id)
            $right_diag.delete(right_diag_id)
        end
    end   
end

def solve_n_queens(n)
    $n = n
    $grid = Array.new(n) {Array.new(n, '.')}
    $col = Array.new(n, true)
    $left_diag = Set.new
    $right_diag = Set.new
    mark(0)
    $result
end
p solve_n_queens(1)
