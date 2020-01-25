require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Perfect Symphony", "Ed Sheeran")
  end

  def test_title
    assert_equal("Perfect Symphony", @song1.title)
  end

  def test_artist
    assert_equal("Ed Sheeran", @song1.artist)
  end


end
