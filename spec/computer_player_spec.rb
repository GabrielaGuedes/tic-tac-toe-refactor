require_relative '../lib/computer_player.rb'
require_relative '../lib/board.rb'

RSpec.describe Game::ComputerPlayer do
  let!(:board) { Game::Board.new }
  subject { described_class.new }

  describe "#spot_to_place_marker" do
    context "when game has just began" do
      it { expect(subject.spot_to_place_marker(board).to_i).to eq(4) }
    end

    context "when human player has occupied tile 4" do
      before do
        board.fill_tile_with(4, "O")
      end

      it { expect(subject.spot_to_place_marker(board).to_i).to_not eq(4) }
    end

    context "when human player is about to win" do
      before do
        board.fill_tile_with(4, "O")
        board.fill_tile_with(0, "X")
        board.fill_tile_with(3, "O")
      end

      it "should prevent his victory" do
        expect(subject.spot_to_place_marker(board).to_i).to eq(5)
      end
    end

    context "when computer player is about to win" do
      before do
        board.fill_tile_with(1, "O")
        board.fill_tile_with(4, "X")
        board.fill_tile_with(3, "O")
        board.fill_tile_with(0, "X")
        board.fill_tile_with(5, "O")
      end

      it "should win" do
        expect(subject.spot_to_place_marker(board).to_i).to eq(8)
      end
    end
  end 
end
