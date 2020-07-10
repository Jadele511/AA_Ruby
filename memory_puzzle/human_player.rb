class HumanPlayer

    attr_reader :name
    def initialize(name)
        @name = name
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            p "Player #{@name}, enter a position with coordinates separated with a space like `4 7`"
            pos = gets.chomp.split.map do |ch|
                if ch.to_i.to_s != ch
                    raise "position should be 2 numbers"
                else
                    ch.to_i
                end
            end
            raise "There should be 2 numbers or one space only" if pos.length != 2
            p 'position is not legal, please enter new position' if !legal_positions.include?(pos)
        end
        pos
    end

    def receive_revealed_card(pos, value)
    end

    def receive_match(pos_1, pos_2)
    end
end

# p = HumanPlayer.new(:X)
# p.get_position