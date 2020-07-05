$grid
$dx = [-1, 0, 1, 0]
$dy = [0, 1, 0, -1]


def mark(x,y)
    (0...4).each do |k|
        i = $dx[k] + x
        j = $dy[k]+ y
        return print_matrix if $grid[i][j] == 'E'
        if $grid[i][j] == ' '
            $grid[i][j] = 'X' 
            mark(i,j)
            $grid[i][j] = ' '
        end
    end
end

def maze_solver
    $grid.each_index do |i|
        $grid[i].each_char.with_index do |ch, j|
            mark(i,j) if $grid[i][j] == 'S'
        end
    end
    $grid
end

def print_matrix
    $grid.each {|row| p row}
end

$grid = Array.new(8,'')
$grid[0] = '*******'
$grid[1] = '*   *E*'
$grid[2] = '* * * *'
$grid[3] = '* *S* *'
$grid[4] = '* * * *'
$grid[5] = '* *** *'
$grid[6] = '*     *'
$grid[7] = '*******'
maze_solver