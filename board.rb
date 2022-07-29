# coding: UTF-8
require './slot'
class Board
    attr_accessor :board

    def initialize()
        @board = Array.new(6){Array.new(7)}

        x = 0
        while x < 6
            y = 0
            while y < 7
                @board[x][y] = Slot.new()
                y+=1
            end
            x+=1
        end
    end


    def print_board
        puts''
        puts "A    B    C    D    E    F    G"

        x = 0
        while x < 6
            y = 0
            while y < 7
                print @board[x][y].symbol
                print '   '
                y+=1
            end
            puts""
            x+=1
        end
    end

    def get_column_array(col)
        col = col.to_sym
        key = {A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6}
        column = []

        x = 0
        until x == 6
            column.append(@board[x][key[col]].symbol)
            x+=1
        end
        column
    end

    def make_move(player)
        empty = "\u26BD"
        empty = empty.encode('utf-8')
        rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        key = {A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6}

        puts "Player #{player.order}, pick a column to drop a #{player.token}: (Enter A-G)"
        col = gets.chomp.upcase
        
        while !rows.include?(col)
            puts "Invalid entry. Pick a column to drop a #{player.token}: (Enter A-G)"
            col = gets.chomp.upcase
        end

        column = get_column_array(col)

        while !column.include?(empty)
            puts "Invalid entry. Pick a column to drop a #{player.token}: (Enter A-G)"
            col = gets.chomp.upcase
            column = get_column_array(col)
        end

        x = 5
        index = 0
        found = false
        while found == false
            if column[x] == empty
                found = true
            else
                x-=1
            end
        end

        @board[x][key[col.to_sym]].symbol = player.token
    end

    def check_victory(player)
        rows = check_rows(player)
        cols = check_cols(player)
        diagonals = check_diagonals(player)
        rev_diagonals = reverse_diagonals(player)
        inv_diagonals = invert_diagonals(player)
        rev_inv_diagonals = reverse_invert_diagonals(player)

        if rows || cols || diagonals || rev_diagonals || inv_diagonals || rev_inv_diagonals
            return true
        end
        false
    end

    def check_rows(player)
        symbol = player.token
        x = 0
        while x < 6
            y = 0
            checker = []
            while y < 7
              checker.append(@board[x][y].symbol)
              y+=1
            end
            one = checker[0..3]
            two = checker[1..4]
            three = checker[2..5]
            four = checker[3..6]
            if (one.all?(symbol))  || (two.all?(symbol)) || (three.all?(symbol)) || (four.all?(symbol))
                return true
            end
            x+=1
        end
        false
    end

    def check_cols(player)
        symbol = player.token
        x = 0
        while x < 7
            y = 0
            checker = []
            while y < 6
              checker.append(@board[y][x].symbol)
              y+=1
            end
            one = checker[0..3]
            two = checker[1..4]
            three = checker[2..5]
            if (one.all?(symbol))  || (two.all?(symbol)) || (three.all?(symbol))
                return true
            end
            x+=1
        end
        false
    end

    def check_diagonals(player)
        symbol = player.token
        x = 0
        while x < 3
            y = 0
            while y < 4
              checker = []
              checker.append(@board[x][y].symbol)
              checker.append(@board[x+1][y+1].symbol)
              checker.append(@board[x+2][y+2].symbol)
              checker.append(@board[x+3][y+3].symbol)
            
              if (checker.all?(symbol))
                  return true
              end
              y+=1
            end
            x+=1
        end
        false
    end

    def reverse_diagonals(player)
        symbol = player.token
        x = 0
        while x < 3
            y = -1
            while y > -5
              checker = []
              checker.append(@board[x][y].symbol)
              checker.append(@board[x+1][y-1].symbol)
              checker.append(@board[x+2][y-2].symbol)
              checker.append(@board[x+3][y-3].symbol)
            
              if (checker.all?(symbol))
                  return true
              end
              y-=1
            end
            x+=1
        end
        false
    end

    def invert_diagonals(player)
        symbol = player.token
        x = 5
        while x > 2
            y = 0
            while y < 4
              checker = []
              checker.append(@board[x][y].symbol)
              checker.append(@board[x-1][y+1].symbol)
              checker.append(@board[x-2][y+2].symbol)
              checker.append(@board[x-3][y+3].symbol)
            
              if (checker.all?(symbol))
                  return true
              end
              y+=1
            end
            x-=1
        end
        false
    end

    def reverse_invert_diagonals(player)
        symbol = player.token
        x = 5
        while x > 2
            y = -1
            while y > -5
              checker = []
              checker.append(@board[x][y].symbol)
              checker.append(@board[x-1][y-1].symbol)
              checker.append(@board[x-2][y-2].symbol)
              checker.append(@board[x-3][y-3].symbol)
            
              if (checker.all?(symbol))
                  return true
              end
              y-=1
            end
            x-=1
        end
        false
    end
end