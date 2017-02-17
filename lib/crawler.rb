require 'pry'
require 'uri'
require 'curb'
require 'nokogiri'

module Ecco
  # JOB: Get website data using a specific adapter.
  class Crawler
    attr_reader :adapter

    def initialize(adapter)
      case adapter
      when :lemonde
        @adapter = LemondeAdapter.new
      when :nzz
        @adapter = NZZAdapter.new
      end
    end

    def get_data
      @adapter.data
    end
  end

  # JOB: Represent Site Data that we need.
  class SiteData
    attr_reader :headline, :description, :link, :image_url

    def initialize(args)
      @headline     = args[:headline]
      @description  = args[:description]
      @link         = args[:link]
      @image_url    = args[:image_url]
    end
  end

  # JOB: Provide common adapter methods
  class Adapter
    attr_reader :article_block, :root_uri

    private
    def get_html(url)
      html_body = Curl.get(url).body_str
      Nokogiri::HTML(html_body)
    end
  end

  # JOB: Parse the actual website data of LeMonde
  class LemondeAdapter < Adapter
    def initialize
      @root_uri = 'http://www.lemonde.fr'
      @article_block = get_html(root_uri).css('.titre_une')
    end

    def data
      SiteData.new(
        headline: article_block.css('.tt3').inner_text,
        description: article_block.css('.description').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src'))
      )
    end
  end

  # JOB: Parse the actual website data of NZZ
  class NZZAdapter < Adapter
    def initialize
      @root_uri =  'https://www.nzz.ch'
      @article_block = get_html(root_uri).css('.teaser--medium').first
    end

    def data
      SiteData.new(
        headline: article_block.css('.title__name').inner_text,
        description: article_block.css('.teaser__lead').inner_text,
        link: URI.parse(root_uri + article_block.css('.teaser__link').first.attr('href')),
        image_url: URI.parse(article_block.css('img').attr('data-srcset').value.slice!(/http[^\s]{1,}.jpeg/))
      )
    end
  end
end
