class Card

    attr_reader :value
    attr_accessor :face_up
    def initialize(value)
        @value = value
        @face_up = false
    end

    def display
        p to_s
    end

    def hide
        self.face_up = false
    end

    def reveal
        self.face_up = true
        self
    end

    def to_s
        if self.face_up 
            self.value 
        else
            ' '
        end

    end

    def ==(other)
        self.value == other.value
    end
end