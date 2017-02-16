require 'pry'
require 'curb'
require 'nokogiri'


def get_html(url)
	html_body = Curl.get(url).body_str
	Nokogiri::HTML(html_body)
end

def get_lemonde_data
	lemonde = get_html("http://www.lemonde.fr/")
	main_article_block = lemonde.css('.trite_une')
	headline = main_article_block.css('h1').inner_text
	description	= main_article_block.css('description').innter_text
	relative_link = main_article_block.css('img').first.attr('src')
	image = main_article_block.css('img').first.attr('src')

  puts headlinde
  puts description
  puts relative_link
  puts imgage
end

# pinding.pry
get_lemonde_data

puts „blabla"
