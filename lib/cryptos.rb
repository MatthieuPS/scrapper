#Scrape dans un array de Hash tout les cryptos sur le site  https://coinmarketcap.com/all/views/all/

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = 'https://coinmarketcap.com/all/views/all/'

page = Nokogiri::HTML(open(URL))
h1 = page.css("h1")
puts h1.text


def crypto_scrapper
  page = Nokogiri::HTML(open(URL).read)
  
names = '//div[@class="sc-1kxikfi-0 fjclfm cmc-table__column-name"]'
prices = '//div[@class="price___3rj7O "]'

names_array = page.css(names).map(&:text)
prices_array = page.css(prices).map(&:text)


crypto =  Hash[names_array.zip(prices_array)]
cryptos = crypto.map{|k, v| {k => v}}
end

puts crypto_scrapper