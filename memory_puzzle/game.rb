require_relative 'card'
require_relative 'board'

class Game

    attr_accessor :previous_guess
    def initialize(n)
        @board = Board.new(n)
        # @board.populate
        @previous_guess = nil

    end

    def make_guess(guessed_pos)
        guess = @board.reveal(guessed_pos) 
        if self.previous_guess.nil?
            self.previous_guess = guess
        else
            if !(guess == self.previous_guess)
                @board.render
                p 'Wrong'
                guess.hide
                self.previous_guess.hide  
            end 
            self.previous_guess = nil          
        end
    end

    def play
        begin
            # system("clear")
            sleep(0.1)
            @board.render
            p 'Enter 2 numbers in this format: 2 4'
            guess = gets.chomp.split.map(&:to_i)
            self.make_guess(guess)
        end until @board.won?
        p ' You won'
    end

end

g = Game.new(2)
g.play