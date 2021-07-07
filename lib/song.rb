class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)    
    end

    def self.new_by_filename(filename)
        dets = filename.split(".")[0].split("-").map {|value| value.strip}
        song = self.new(dets[1])
        song.artist_name=(dets[0])
        song
    end
end