require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    name = Song.new
    self.all << name
    name
  end

  def self.create_by_name(song_name)
    song = Song.new

    song.name = song_name
    self.all << song
    # binding.pry
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.collect do |song|
      if song.name == song_name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      song = self.find_by_name(song_name)
    else
      return song = self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    return song_names = self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file_name)
    title_and_artist = file_name.split(".")
    title_and_artist = title_and_artist[0]
    title_and_artist = title_and_artist.split(" - ")
    song = Song.new
    song.name = title_and_artist[1]
    song.artist_name = title_and_artist[0]
    song
  end

  def self.create_from_filename(file_name)
    title_and_artist = file_name.split(".")
    title_and_artist = title_and_artist[0]
    title_and_artist = title_and_artist.split(" - ")
    song = Song.create_by_name(title_and_artist[1])
    song.artist_name = title_and_artist[0]
    song
  end

  def self.destroy_all
    @@all = []
  end
end
