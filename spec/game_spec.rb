RSpec.describe Game do
  it "has a version number" do
    expect(Game::VERSION).not_to be nil
  end
end
