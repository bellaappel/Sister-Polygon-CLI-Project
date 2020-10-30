class CLI
    attr_accessor :scrape

    def intro 
        greeting
        display_web_bio
    end

    def run
        print_all_artists_to_select
        select_artist
        print_artists_info
    end

    def greeting
        puts "Hi! Welcome to Sister Polygon Records CLI Application".light_yellow.bold
        text=File.open('ascii2.txt').read

        text.each_line do |line|
            print "#{line}"
        end

        puts ""
        puts ""
    end

    def display_web_bio
        puts "Sister Polygon Records was founded in Washington, DC in 2012 by members of the band Priests. Initially created as a vehicle to release their first 7” single, featuring the songs “Radiation” and “Personal Planes,” the label soon began releasing music by bands and artists with whom they’d shared a bill and admired, including Downtown Boys, Shady Hawkins, and Neonates. SPR was soon home to a constellation of acts emerging acts from the DC, Maryland and Virginia area, including Snail Mail, Gauche, Sneaks, Flasher, and Hothead. Priests’ Nothing Feels Natural was Sister Polygon’s first full-length LP released on vinyl in 2017. Secretly Distribution now carries Sister Polygon Records’ releases worldwide, and probably in an independent record store near you."
        sleep (3)

        text=File.open('ascii.txt').read
        text.each_line do |line|
             print "#{line}"
        end
        puts ""

        @scrape = Scraper.new
        @scrape.first_scrape
       
    end

    def print_all_artists_to_select
        puts "====================================================="
        puts "Please select number 1 to #{Artist.all.length} for corresponding artist".light_yellow
        puts "====================================================="
        sleep (2)
        Artist.all.each_with_index do |artist, index|
            puts "#{index +1} #{artist.artist}"    
        end
    end

    def select_artist
        user_input = gets.chomp.to_i - 1
           until user_input.between?(0,Artist.all.length - 1)
            puts "Invalid input please put number between 1 and #{Artist.all.length}"
            user_input = gets.chomp.to_i - 1 
           end
        @selected_artist = Artist.all[user_input]
        @scrape.second_scrape(@selected_artist)
    end

    def print_artists_info
            puts "---------------"
            puts "#{@selected_artist.artist_bio}"
            puts "---------------"
            puts "#{@selected_artist.artist_members}"
        
        sleep (2)
        puts "1) Return to list of artists!"
        puts "2) Exit!"
        user_input = gets.chomp
            if user_input == "1"
                run
            elsif user_input == "2"
                exit
            end
    end

end