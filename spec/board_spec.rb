require_relative '../lib/board.rb'

RSpec.describe Game::Board do
  let!(:tiles) { %w[0 1 2 3 4 5 6 7 8] }
  subject(:board) { described_class.new }

  describe "#available_tile?" do
    context "when game has just began" do
      it do 
        tiles.each do |tile|
          expect(board.available_tile?(tile)).to eq(true)
        end
      end
    end

    context "when a tile is occupied" do
      before do
        board.fill_tile_with(7, "X")
      end
      it { expect(board.available_tile?(7)).to eq(false) }
    end
  end

  describe "#fill_tile_with" do
    before do
      board.fill_tile_with(5, "X")
    end
    it { expect(board.tiles[5]).to eq("X") }
  end

  describe "#board_full?" do
    context "when game has just began" do
      it { expect(board.board_full?).to eq(false) }
    end
    
    context "when game gas ended" do
      before do
        tiles.each do |tile|
          board.fill_tile_with(tile, "X")
        end
      end
      it { expect(board.board_full?).to eq(true) }
    end
  end

  describe "#available_tiles" do
    context "when game has just began" do
      it { expect(board.available_tiles).to eq(tiles) }
    end

    context "when a tile is occupied" do
      before do
        board.fill_tile_with(2, "X")
      end
      it { expect(board.available_tiles).to eq(tiles.select{ |tile| tile != "2" }) }
    end
  end

  describe "#valid_sequency_with_equal_markers?" do
    context "when game has just began" do
      it { expect(board.valid_sequency_with_equal_markers?).to eq(false) }
    end
    context "when game is over" do
      before do
        board.fill_tile_with(0, "X")
        board.fill_tile_with(1, "X")
        board.fill_tile_with(2, "X")
      end
      it { expect(board.valid_sequency_with_equal_markers?).to eq(true) }
    end
  end
end
