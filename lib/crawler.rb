require 'pry'
require 'uri'
require 'curb'
require 'nokogiri'

module Ecco
  class Crawler
    attr_reader :adapter

    def initialize(adapter)
      case adapter
      when :lemonde
        @adapter = LemondeAdapter.new
      end
    end

    def get_data
      @adapter.data
    end
  end

  class SiteData
    attr_reader :headline, :description, :link, :image_url

    private

    def get_html(url)
      html_body = Curl.get(url).body_str
      Nokogiri::HTML(html_body)
    end
  end

  class LemondeAdapter < SiteData
    ROOT_URI = 'http://www.lemonde.fr'.freeze

    def data
      lemonde = get_html(ROOT_URI)
      main_article_block = lemonde.css('.titre_une')

      @headline = main_article_block.css('h1').inner_text
      @description = main_article_block.css('.description').inner_text
      @link = URI.parse(ROOT_URI + main_article_block.css('a').first.attr('href'))
      @image_url = URI.parse(main_article_block.css('img').first.attr('src'))

      return self
    end
  end
end
