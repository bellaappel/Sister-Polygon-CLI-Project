class CLI
    attr_accessor :scrape

    def initialize
        puts "Hi! Welcome to Sister Polygon Records CLI Application".light_yellow.bold
        text=File.open('ascii2.txt').read
        text.each_line do |line|
        print "#{line}"
        end
        puts ""
        puts ""
        puts "Sister Polygon Records was founded in Washington, DC in 2012 by members of the band Priests. Initially created as a vehicle to release their first 7” single, featuring the songs “Radiation” and “Personal Planes,” the label soon began releasing music by bands and artists with whom they’d shared a bill and admired, including Downtown Boys, Shady Hawkins, and Neonates. SPR was soon home to a constellation of acts emerging acts from the DC, Maryland and Virginia area, including Snail Mail, Gauche, Sneaks, Flasher, and Hothead. Priests’ Nothing Feels Natural was Sister Polygon’s first full-length LP released on vinyl in 2017. Secretly Distribution now carries Sister Polygon Records’ releases worldwide, and probably in an independent record store near you."
        sleep (3)
        text=File.open('ascii.txt').read
        text.each_line do |line|
        print "#{line}"
        end
        puts ""
        puts "====================================================="
        puts "====================================================="
        Scraper.new.first_scrape
        puts "Please select number 1 to #{Artist.all.length} for corresponding artist".light_yellow
        puts "====================================================="
        sleep (1)
        Artist.print_all_artists_to_select
        artists_select = gets.chomp
        select_to_index = artists_select.to_i - 1
        Scraper.new.second_scrape(Artist.all[select_to_index])
        Artist.all[select_to_index].print_artists_members_and_bio
        sleep (2)
        puts "1) Return to artist!"
        puts "2) Exit!"
        user_input = gets.chomp
            if user_input == "1"
                Artist.rerun
            elsif user_input == "2"
                exit
            end

    end


end