module Ecco
  class GuardianAdapter < Adapter

    def initialize
      @root_uri = 'https://www.theguardian.com/international'
      @article_block = get_html(root_uri)
    end

    def data
      SiteData.new(
        headline: article_block.css('.fc-item__content .fc-item__header').first.inner_text,
        description: article_block.css('.fc-item__content .fc-item__standfirst').first.content,
        link: URI.parse(root_uri + article_block.css('.u-faux-block-link__overlay').first.attr('href')),
        image_url: URI.parse(article_block.css('.fc-item__media-wrapper picture source').first.attr('srcset'))
      )
    end
  end
end
