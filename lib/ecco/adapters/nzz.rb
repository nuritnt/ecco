module Ecco
  class NzzAdapter < Adapter
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
