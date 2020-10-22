class CLI
    attr_accessor :scrape

    def initialize
        puts "Hi! Welcome to Sister Polygon Records CLI Application"
        puts "====================================================="
        Scraper.new.first_scrape
        puts "Please select number 1 to #{Artist.all.length} for corresponding artist"
        puts "======================================================"
        sleep (1)
        Artist.print_all_artists_to_select
        artists_select= gets.chomp
        select_to_index = artists_select.to_i - 1
        Scraper.new.second_scrape(Artist.all[select_to_index])
        Artist.all[select_to_index].print_artists_members_and_bio
    end


end