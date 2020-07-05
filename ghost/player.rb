class Player

    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess(fragment)
        input = gets.chomp
    end

    def alert_invalid_guess(letter)
        raise "#{letter} is not valid"
    end


end