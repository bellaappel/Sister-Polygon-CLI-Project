
   
class Artist
    attr_accessor :artist, :artist_url, :artist_bio, :artist_members
    
    @@all = []
    

    def initialize (artist, artist_url)
        @artist = artist
        @artist_url = artist_url
      
       
        @@all << self
    end

    def self.all
        @@all
    end


    def self.print_all_artists_to_select
        @@all.each_with_index do |artist, index|
            puts "#{index +1} #{artist.artist}"
            
        end
    end

    def print_artists_members_and_bio
        puts "---------------"
        puts "#{@artist_bio}"
        puts "---------------"
        puts "#{@artist_members}"
    
    end

    
   
end