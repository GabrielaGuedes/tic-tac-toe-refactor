module Game
  class HumanPlayer
    MARKER = "O"

    def spot_to_place_marker(board)
      @board = board
      spot || spot_to_place_marker(@board)   
    end

    private

    def spot
      spot = gets.chomp.to_i
      return spot if @board.available_tile?(spot)

      false
    end
  end
end