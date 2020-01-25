class Room

  attr_reader :name, :capacity, :songs, :entry_fee, :guests, :lobby
  attr_writer :till
  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @songs = []
    @lobby = []
    @guests = []
    @entry_fee = entry_fee
    @till = 0
  end

  def guests_count()
    return @guests.count()
  end

  def songs_count()
    return @songs.count()
  end

  def till_count()
    return @till
  end



 def check_in_guest(guest, entry_fee)
   if guest.wallet >= entry_fee
     guest.pay_entry_fee(entry_fee)
     @till += entry_fee
     @guests.push(guest)
     return @guests.count()
   end
 end


  def check_out_guest(guest)
    @guests.delete(guest)
  end

 def add_songs_to_room(songs)
   @songs.concat(songs)
 end

 def not_enough_space
   if @guests.count > @capacity
     return "Not enough space in this room"
   else
     return "Welcome to the room!"
   end
 end



end
