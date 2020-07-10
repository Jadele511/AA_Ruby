class ComputerPlayer
    attr_reader :name
    attr_accessor :known_cards, :excluded_pos, :matched_cards, :guess_counter
    def initialize(name)
        @name = name
        @known_cards = Hash.new {|hash,value| hash[value] = []}
        @excluded_pos = []
        @guess_counter = 0
        @working_pair = nil
    end

    def first_guess(legal_positions)
        pairs = @known_cards.values.select {|arr| arr.length == 2}
        if pairs.empty?
            return (legal_positions.reject{|ele| @excluded_pos.include?(ele)}).sample
        else
            @working_pair = pairs.first
            return @working_pair.first
        end
    end

    def second_guess(legal_positions)
        if (@working_pair)
            pos = @working_pair.second
            @working_pair = nil
            return pos
        else
            return (legal_positions.reject{|ele| @excluded_pos.include?(ele)}).sample
        end
    end

    def get_position(legal_positions)  
        @guess_counter += 1
        pos = guess_counter.odd? ? first_guess(legal_positions) : second_guess(legal_positions)
        pos
    end

    def receive_revealed_card(pos, value)
        @excluded_pos << pos
        @known_cards[value] << pos if !@known_cards.includes?(value) || !@known_cards[value].include?(pos)
    end

    def receive_match(pos_1, pos_2)
        @known_cards.each do |k,v| 
            if v.include?(pos_1)
                @known_cards.delete!(k)
            end
        end
    end

end