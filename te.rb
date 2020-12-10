require 'net/http'
require 'nokogiri'

https = Net::HTTP.new('www.imdb.com', 443)

https.use_ssl = true

response = https.get("/chart/moviemeter")

doc = Nokogiri::HTML(response.body)

doc.search('.lister-list .titleColumn a').each do |a|
  puts "\n#{a.content} - #{a.attributes['title']}\n" 
end
