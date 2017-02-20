module Ecco
  class ElpaisAdapter < Adapter
    def initialize
      @root_uri = 'http://elpais.com'
      @article_block = get_html(root_uri).css('.articulo.articulo--primero')
    end

    def data
      SiteData.new(
        headline: article_block.css('h2').inner_text,
        description: article_block.css('.articulo-entradilla').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        image_url: URI.parse(article_block.css('img').first.attr('data-src'))
      )
    end
  end
end
