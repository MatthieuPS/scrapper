 
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))

def get_email (urldeputy)
	page = Nokogiri::HTML(URI.open(urldeputy).read)
	email = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a').text

	nom = page.css('h1').text
	print nom + " : "
	puts email
end


def get_all_urls()
	#url = "http://www.nosdeputes.fr/" + prenom + "-" + nom
	doc = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes").read)
	div_classes = doc.xpath('//div[@class="list_table"]')
	all_a = div_classes.css('a')   

	all_urls = all_a.map{|element| urls = 'https://nosdeputes.fr'+element["href"]}

	# puts touteslesurl

	all_urls.each { |url| puts get_email(url) }

end

get_all_urls