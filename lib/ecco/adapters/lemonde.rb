module Ecco
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
end
