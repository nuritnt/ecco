module Ecco
  class DailymailAdapter < Adapter

    def initialize
      @root_uri = 'http://www.dailymail.co.uk/home/index.html'
      @article_block = get_html(root_uri).css('.gamma')
    end

    def data
      SiteData.new(
        headline: article_block.css('.linkro-darkred > a').text,
        description: article_block.css('.articletext > div > p').first.inner_text,
        link: URI.parse(root_uri + article_block.css('.article a').first.attr('href')),
        image_url: URI.parse(article_block.css('.article img').first.attr('data-src'))
      )
    end
  end
end
