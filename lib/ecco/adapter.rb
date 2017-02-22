module Ecco
  # JOB: Provide common adapter methods
  class Adapter
    attr_reader :article_block, :root_uri

    private

    def get_html(url)
      html_body = Curl.get(url).body_str
      Nokogiri::HTML(html_body)
    end
  end
end
