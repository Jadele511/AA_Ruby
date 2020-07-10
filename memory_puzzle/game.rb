require_relative 'card'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :players, :board
    attr_accessor :previous_guess, :current_player, :previous_player
    def initialize(n, player_names)
        @board = Board.new(n)
        @previous_guess = nil
        @players = player_names.map{|name| name[0] =='m' ? ComputerPlayer.new(name) : HumanPlayer.new(name)}
        @current_player = players.first
        @previous_player = nil
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

    def switch_turn
        @players.rotate!
        @previous_player = @current_player
        @current_player = @players.first
    end

    def play
        begin
            p "Player #{@current_player.name}'s turn"
            # 1st guess
            pos = @current_player.get_position(@board.legal_positions)
            p "Player #{@current_player.name} chose position #{pos}" 
            self.make_guess(pos)
            @board.render
            # 2nd guess
            pos = @current_player.get_position(@board.legal_positions)
            p "Player #{@current_player.name} chose position #{pos}" 
            self.make_guess(pos)
            @board.render
            #next
            self.switch_turn
        end until @board.won?
        p "#{@previous_player.name} won"
    end

end

g = Game.new(2, ['m','h'])
g.play