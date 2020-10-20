require_relative "enviroment.rb"

url = "https://www.sisterpolygonrecords.com/"
html = open(url)
html_parsed_to_elements = Nokogiri::HTML(html)
binding.pry