module Ecco
  class NytAdapter < Adapter
    def initialize
      @root_uri = 'https://www.nytimes.com'
      @article_block = get_html(root_uri).css('.story.theme-summary.lede')
    end

    def data
      SiteData.new(
        headline: article_block.css('h2').inner_text,
        description: article_block.css('ul').inner_text,
        link: URI.parse(root_uri + article_block.css('a').first.attr('href')),
        # image_url: link(.image).first.attr('src')
      )
    end
  end
end
