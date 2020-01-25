require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")
require_relative("../room")
class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Perfect Symphony", "Ed Sheeran")

    @guest1 = Guest.new("Andrew McConnel", 100, @song1)

    @room1 = Room.new("Cave", 2, 20)
  end

  def test_name
    assert_equal("Andrew McConnel", @guest1.name)
  end

  def test_money_in_wallet
    assert_equal(100, @guest1.wallet)
  end

  def test_favourite_song
    assert_equal("Perfect Symphony", @guest1.favourite_song.title)
  end

  def test_pay_entry_fee
    @guest1.pay_entry_fee(@room1.entry_fee)
    assert_equal(80, @guest1.wallet)
  end

  def test_guest_cheer
    assert_equal("Whooooo!", @guest1.guest_cheer(@guest1.favourite_song))
  end



end
