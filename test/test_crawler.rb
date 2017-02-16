gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/crawler'


module Ecco
  class CrawlerTest < Minitest::Test

    def test_le_monde
      crawler = Crawler.new(:lemonde)
      data = crawler.get_data

      assert_kind_of Ecco::LemondeAdapter, data
      assert_kind_of String, data.headline
      assert_kind_of String, data.description
      assert_kind_of URI, data.link
      assert_kind_of URI, data.image_url
    end
  end
end
