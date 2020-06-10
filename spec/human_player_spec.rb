require_relative '../lib/human_player.rb'
require_relative '../lib/board.rb'

RSpec.describe Game::HumanPlayer do
  let!(:board) { Game::Board.new }
  subject(:human_player) { described_class.new }

  describe "#spot_to_place_marker" do
    it { expect(board.available_tile?(human_player.spot_to_place_marker(board))).to eq(true) }
  end
end
