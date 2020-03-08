require_relative './lib/board.rb'

module Game
  class CLI
    class << self
      def start
        @board = ::Game::Board.new
        @com = "X" # the computer's marker
        @hum = "O" # the user's marker

        start_game
      end

      def start_game
        # start by printing the board
        @board.print_board
        puts "Enter [0-8]:"
        # loop through until the game was won or tied
        until game_is_over(@board) || tie(@board)
          get_human_spot
          if !game_is_over(@board) && !tie(@board)
            eval_board
          end
          @board.print_board
        end
        puts "Game over"
      end

      def get_human_spot
        spot = nil
        until spot
          spot = gets.chomp.to_i
          if @board.available_tile?(spot)
            @board.fill_tile_with(spot, @hum)
          else
            spot = nil
          end
        end
      end

      def eval_board
        spot = nil
        until spot
          if @board.available_tile?(4)
            spot = 4
            @board.fill_tile_with(spot, @com)
          else
            spot = get_best_move(@board, @com)
            if @board.available_tile?(spot)
              @board.fill_tile_with(spot, @com)
            else
              spot = nil
            end
          end
        end
      end

      def get_best_move(board, next_player, depth = 0, best_score = {})
        best_move = nil
        board.available_tiles.each do |as|          
          board.fill_tile_with(as.to_i, @com)
          if game_is_over(board)
            best_move = as.to_i
            board.fill_tile_with(as.to_i, as)
            return best_move
          else
            board.fill_tile_with(as.to_i, @hum)
            if game_is_over(board)
              best_move = as.to_i
              board.fill_tile_with(as.to_i, as)
              return best_move
            else
              board.fill_tile_with(as.to_i, as)
            end
          end
        end
        if best_move
          return best_move
        else
          n = rand(0..board.available_tiles.count)
          return board.available_tiles[n].to_i
        end
      end

      def game_is_over(b)
        @board.valid_sequency_with_equal_markers?
      end

      def tie(b)
        @board.board_full?
      end
    end
  end
end
