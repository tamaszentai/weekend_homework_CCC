require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Perfect Symphony", "Ed Sheeran")
    @song2 = Song.new("How much is the fish", "Scooter")
    @song3 = Song.new("Toxic", "Britney Spears")
    @song4 = Song.new("Baby's Got A Temper ", "Prodigy")

    @guest1 = Guest.new("Andrew McConnel", 100, @song1)
    @guest2 = Guest.new("Daniel Pinter", 15, @song2)
    @guest3 = Guest.new("Paloma Martinez", 60, @song3)
    @guest4 = Guest.new("Michael English", 20, @song4)

    @songs = [@song1, @song2, @song3, @song4]

    @room1 = Room.new("Cave", 2, 20)

  end


  def test_name
    assert_equal("Cave", @room1.name)
  end

  def test_capacity
    assert_equal(2, @room1.capacity)
  end


  def test_entry_fee
    assert_equal(20, @room1.entry_fee)
  end

  def test_guests_count
    assert_equal(0, @room1.guests_count())
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest4, @room1.entry_fee)
    assert_equal(1, @room1.guests.count())
    assert_equal(0, @guest4.wallet)
    assert_equal(20, @room1.till_count)
  end


  def test_check_out_guest
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    @room1.check_in_guest(@guest4, @room1.entry_fee)
    @room1.check_out_guest(@guest1)
    assert_equal(1, @room1.guests_count)
  end


  def test_add_songs_to_room
    @room1.add_songs_to_room(@songs)
    assert_equal(4, @room1.songs_count)
  end

  def test_not_enough_space
    @room1.check_in_guest(@guest1, @room1.entry_fee)
    @room1.check_in_guest(@guest4, @room1.entry_fee)
    @room1.check_in_guest(@guest3, @room1.entry_fee)
    # assert_equal(3, @room1.guests_count())
    assert_equal("Not enough space in this room", @room1.not_enough_space)
  end









end
