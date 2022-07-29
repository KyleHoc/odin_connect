# coding: UTF-8
class Player
    attr_accessor :token, :order
    def initialize()
        @token = nil
        @order = nil
    end
    
    def assign_p1
        @order = '1'
        puts "Player 1, will you be black or white? (enter 'b' or 'w' to decide)"
        input = gets.chomp.upcase

        while token == nil
            if input == 'B'
                @token = "\u26AB"
                @token = @token.encode('utf-8')
            elsif input == 'W'
                @token = "\u26AA"
                @token = @token.encode('utf-8')
            else
                puts "Invalid entry. Try again."
                input = gets.chomp.upcase
            end
        end
    end

    def assign_p2(p1)
        black = "\u26AB"
        black = black.encode('utf-8')
        @order = '2'
        if p1.token == black
            @token = "\u26AA"
            @token = @token.encode('utf-8')
        else
            @token = "\u26AB"
            @token = @token.encode('utf-8')
        end
    end

    def print_message
        puts "Player #{@order} wins! #{@token}#{@token}#{@token}#{@token}"
    end
end

#@token = "\u26AB"
#@token = @token.encode('utf-8')

#@token = "\u26AA"
#@token = @token.encode('utf-8')