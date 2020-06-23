module Game
  class Board
    
    def tiles
      @tiles ||= %w[0 1 2 3 4 5 6 7 8]
    end

    def print_board
      print_row(top_row)
      print_board_separator
      print_row(middle_row)
      print_board_separator
      print_row(bottom_row)
    end

    def available_tile?(tile)
      available_tiles.include?(tile.to_s)
    end

    def fill_tile_with(tile, marker)
      tiles[tile.to_i] = marker
    end

    def board_full?
      !available_tiles.any?
    end

    def available_tiles
      tiles.select {|tile| tile == "#{tiles.index(tile)}" }
    end

    def valid_sequency_with_equal_markers?
      valid_sequencies.select{|sequency| sequency.uniq.length == 1}.any?
    end

    private

    def print_board_separator
      puts "===+===+==="
    end

    def print_row(row)
      puts "#{row[0]} | #{row[1]} | #{row[2]}"   
    end

    def valid_sequencies
      [top_row, middle_row, bottom_row, right_column, middle_column, left_column, main_diagonal, secondary_diagonal]
    end

    def top_row
      [tiles[0], tiles[1], tiles[2]]
    end

    def middle_row
      [tiles[3], tiles[4], tiles[5]]
    end

    def bottom_row
      [tiles[6], tiles[7], tiles[8]]
    end

    def left_column
      [tiles[0], tiles[3], tiles[6]]
    end

    def middle_column
      [tiles[1], tiles[4], tiles[7]]
    end

    def right_column
      [tiles[2], tiles[5], tiles[8]]
    end

    def main_diagonal
      [tiles[0], tiles[4], tiles[8]]
    end

    def secondary_diagonal
      [tiles[2], tiles[4], tiles[6]]
    end
  end
end
