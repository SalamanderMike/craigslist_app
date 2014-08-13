# Scraper.rb
# atm, searching for results in Aug 12 works
# There are no dog postings for today, however

require 'nokogiri'
require 'open-uri'
url = open("petURL.html").read
# url = open("pet2URL.html").read
# url = "http://sfbay.craigslist.org/sfc/pet/"
page = Nokogiri::HTML(url)
today = Time.now.strftime("%b %d")

def filter_links(page, today)
  page.css('p.row span.txt span.pl').map do |link|
    dog = link.text.match(/(pup|puppy|puppies|dog)/)
    day = link.css('span.date').text
    if day == "Aug 12" # today
      if dog != nil
        site = link.to_s.match(/\/sfc\/pet\/\d{1,}\.html/)
        puts day
        puts link.css('a.hdrlnk').text
        puts site
        puts '*'*60
      end
    end
  end
end


puts "Today is: #{today}"
filter_links(page, today)



