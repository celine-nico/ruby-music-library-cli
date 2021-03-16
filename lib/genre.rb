class Genre 
    extend Concerns::Findable
    
    attr_accessor :name, :artist, :song
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
        genre = Genre.new(name)
    end 

    def songs 
        Song.all.select{|song| song.genre == self}
    end 

    def artists
        songs.collect {|song| song.artist}.uniq
    end
end 