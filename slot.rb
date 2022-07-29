# coding: UTF-8
class Slot
    attr_accessor :symbol
    def initialize()
        @symbol = "\u26BD"
        @symbol = @symbol.encode('utf-8')
    end

    def symbol()
        @symbol
    end
end