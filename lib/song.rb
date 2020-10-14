require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    # i = 0
    # match = ""
    # while i < @@all.length
    #   if @@all[i].name == name
    #     match = @@all[i]
    #     return match
    #   else
    #     i += 1
    #   end
    # end
    #   if match == ""
    #     return false
    #   end
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # truthy = self.find_by_name(name)
    # if truthy == false
    #   self.create_by_name(name)
    # else
    #   return truthy
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end

end
