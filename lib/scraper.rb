
require "pry"


class Scraper

    def initialize
        @base_url = "https://www.sisterpolygonrecords.com/"
        @url = "https://www.sisterpolygonrecords.com/artists"

    end

    def first_scrape
        html = open(@url)
        artists_elements = Nokogiri::HTML(open(html))
       
        artists_elements.css(".project-percent").each do |artist|
            name = artist.css(".text-block-3").text
            artist_url = @base_url + artist.css("a").attribute("href").value
            artist = Artist.new(name, artist_url) 
            
        end
    end

    def second_scrape (artist)
        artist_html = open("#{artist.artist_url}")
        artist_html_parsed_to_elements = Nokogiri::HTML(artist_html)
        artist.artist_bio = artist_html_parsed_to_elements.css(".div-block-6").children[1].text
        artist.artist_members = artist_html_parsed_to_elements.css(".paragraph-small.block").text

        
    end


end
