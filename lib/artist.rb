class Artist 
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name 
        save
    end 

    def save 
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def self.destroy_all
        @@all.clear()
    end 

    def self.create(name)
        artist = Artist.new(name)
    end 

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist ||= self
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end
end