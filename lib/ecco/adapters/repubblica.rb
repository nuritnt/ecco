module Ecco
  class RepubblicaAdapter < Adapter

    def initialize
      @root_uri = 'http://www.repubblica.it/'
      @article_block = get_html(root_uri).css('article.has-image').first
    end

    def data
      return SiteData.new(
        headline: article_block.css('header > h1').inner_text,
        description: article_block.css('header > h2').inner_text,
        link: URI.parse(article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('src'))
      )
    end
  end
end
