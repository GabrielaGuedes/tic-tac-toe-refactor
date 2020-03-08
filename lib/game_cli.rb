require_relative './board.rb'
require_relative './computer_player.rb'

module Game
  class GameCLI
    class << self

      def start
        instance_players_and_board
        run_game
      end

      private

      def instance_players_and_board
        @computer_player = Game::ComputerPlayer.new
        @human_player = Game::HumanPlayer.new
        @board = Game::Board.new
      end

      def run_game
        @board.print_board
        puts "Enter [0-8]:"
        control_turns until game_is_over?
        puts "Game over"
      end

      def control_turns
        human_turn
        computer_turn unless game_is_over?
        @board.print_board
      end

      def human_turn
        spot = @human_player.spot_to_place_marker(@board)
        @board.fill_tile_with(spot, Game::HumanPlayer::MARKER)
      end

      def computer_turn
        spot = @computer_player.spot_to_place_marker(@board)
        @board.fill_tile_with(spot, Game::ComputerPlayer::MARKER)
      end

      def game_is_over?
        @board.valid_sequency_with_equal_markers? || tie?
      end

      def tie?
        @board.board_full?
      end
    end
  end
end
