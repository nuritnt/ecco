require 'pry'
require 'curb'
require 'nokogiri'


def get_html(url)
	html_body = Curl.get(url).body_str
	Nokogiri::HTML(html_body)
end

def get_lemonde_data
	lemonde = get_html("http://www.lemonde.fr")
	main_article_block = lemonde.css('.titre_une')
	headline = main_article_block.css('h1').inner_text
	description	= main_article_block.css('.description').inner_text
	relative_link = main_article_block.css('a').first.attr('href')
	image = main_article_block.css('img').first.attr('src')

  puts headline
  puts description
  puts relative_link
  puts image
end

def get_nzz_data
  nzz = get_html("https://www.nzz.ch")
  main_article_block = nzz.css('.teaser--medium').first
  headline = main_article_block.css('.title__name').inner_text
  description = main_article_block.css('.teaser__lead').inner_text
  relative_link = main_article_block.css('.teaser__link').first.attr('href')
  image_data_srcset = main_article_block.css('img').attr('data-srcset').value
  image = image_data_srcset.slice!(/http[^\s]{1,}.jpeg/)

  puts headline
  puts description
  puts relative_link
  puts image
end

# pinding.pry
get_lemonde_data
get_nzz_data
puts 'finito.'
