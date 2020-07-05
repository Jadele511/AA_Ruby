require 'set'
require_relative 'player'
require 'byebug'

class Game
    attr_reader :players, :dictionary, :current_player, :previous_player
    attr_accessor :fragment, :losses
    def initialize(*player_names)
        @players = []
        @losses = {}
        player_names.each do |name|
            player = Player.new(name)
            @players << player
            @losses[player] = 0
        end
        @fragment = ''
        @dictionary = []
        File.open('dictionary.txt', 'r').each_line do |line|
            @dictionary << line.strip
        end
        @dictionary.to_set
        @current_player = players.first
        @previous_player = nil
    end

    def next_player!
        @previous_player = @current_player
        @players.rotate!
        @current_player = @players.first
        
    end 

    def valid_play?(input)
        alpha = ('a'..'z').to_a
        return false if !alpha.include?(input)
        @dictionary.any? do |word|       
            word.start_with?(@fragment+input)
        end
    end

    def take_turn(player)
        input = ""
        begin 
            p "Player #{player.name}, enter a letter:"
            input = gets.chomp
            if valid_play?(input)
                @fragment += input
                break
            end
            p 'Invalid letter'
        end until false
    end

    def record(player)
        'GHOST'[0...@losses[player]]
    end


    def play_round
        begin
            
            take_turn(@current_player)
            p "Current fragment is #{@fragment}" 
            next_player!
        end until @dictionary.include?(@fragment)
        @losses[@previous_player] += 1
        if @losses[@previous_player] == 5
            @players.delete(@previous_player) 
            @losses.delete(@previous_player)
            p "Eliminate #{@previous_player.name}"
        end
    end

    def display_standings
        @losses.each do |player,val|
            p "#{player.name} has #{val} loss(es)"
        end
    end

    def run 
        while @players.length > 1
            @fragment = ''
            display_standings
            play_round
        end 
        p "#{@players[0].name} is the winner"
    end

end

g = Game.new(:A, :B, :C)
p g.run
