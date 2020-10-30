class Artist
    attr_accessor  :artist_bio, :artist_members
    attr_reader :artist, :artist_url
    
    @@all = []
    
    def initialize (artist, artist_url)
        @artist = artist
        @artist_url = artist_url
        @@all << self
    end

    def self.all
        @@all
    end
    
    # def self.rerun
    #     Artist.print_all_artists_to_select
    #     artists_select = gets.chomp
    #     select_to_index = artists_select.to_i - 1
    #     Scraper.new.second_scrape(Artist.all[select_to_index])
    #     Artist.all[select_to_index].print_artists_members_and_bio
    #     puts "press 1 to return to list of artists or 2 to exit app!"
    #     user_input = gets.chomp
    #         if user_input == "1"
    #             Artist.rerun
    #         elsif user_input == "2"
    #             exit
    #         end
    # end
    
end