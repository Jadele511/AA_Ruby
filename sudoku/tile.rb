class Tile
    attr_reader :value, :given
    def initialize(value)
        @value = value.to_i
        @given = @value != 0
    end

    def inspect
        @value.to_s
    end

    def value=(new_value)
        if @given 
          puts "You can't change the value of a given tile."
        else
          @value = new_value
        end
      end
end