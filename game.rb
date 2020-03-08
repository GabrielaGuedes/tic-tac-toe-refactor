require_relative './lib/board.rb'
require_relative './lib/computer_player.rb'

module Game
  class CLI
    class << self
      def start
        @board = Game::Board.new
        @computer_player = Game::ComputerPlayer.new
        @human_player = Game::HumanPlayer.new
        @hum = "O" # the user's marker

        start_game
      end

      def start_game
        # start by printing the board
        @board.print_board
        puts "Enter [0-8]:"
        # loop through until the game was won or tied
        until game_is_over || tie
          get_human_spot
          if !game_is_over && !tie
            eval_computer_turn
          end
          @board.print_board
        end
        puts "Game over"
      end

      def get_human_spot
        spot = @human_player.spot_to_place_marker(@board)
        @board.fill_tile_with(spot, Game::HumanPlayer::MARKER)
      end

      def eval_computer_turn
        spot = @computer_player.spot_to_place_marker(@board)
        @board.fill_tile_with(spot, Game::ComputerPlayer::MARKER)
      end

      def game_is_over
        @board.valid_sequency_with_equal_markers?
      end

      def tie
        @board.board_full?
      end
    end
  end
end
