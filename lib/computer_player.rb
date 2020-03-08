require_relative './human_player.rb'

module Game
  class ComputerPlayer
    MARKER = "X"

    def spot_to_place_marker(board)
      @board = board
      return 4 if board.available_tile?(4)
      get_best_spot
    end

    private

    def get_best_spot
      smart_spot || get_random_spot
    end

    def smart_spot
      smart_spot = nil
      @board.available_tiles.each do |available_tile|
        smart_spot = available_tile if strategic_tile?(available_tile)
        undo_test_filling(available_tile)
      end
      smart_spot
    end

    def strategic_tile?(tile)
      computer_wins_with_test_filling?(tile) || test_filling_prevents_human_to_win?(tile)
    end

    def computer_wins_with_test_filling?(tile)
      @board.fill_tile_with(tile, MARKER)
      game_ends?
    end

    def test_filling_prevents_human_to_win?(tile)
      @board.fill_tile_with(tile, Game::HumanPlayer::MARKER)
      game_ends?
    end

    def undo_test_filling(tile)
      @board.fill_tile_with(tile, tile)
    end

    def game_ends?
      @board.valid_sequency_with_equal_markers?
    end

    def get_random_spot
      n = rand(0..@board.available_tiles.count)
      @board.available_tiles[n].to_i
    end

  end
end