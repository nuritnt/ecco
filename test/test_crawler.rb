gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/ecco'

module Ecco
  class CrawlerTest < Minitest::Test
    def test_le_monde
      crawler = Crawler.new(:lemonde)
      site_data = crawler.crawl

      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
    end

    def test_nzz
      crawler = Crawler.new(:nzz)
      site_data = crawler.crawl

      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
    end

    def test_guardian
      crawler = Crawler.new(:guardian)
      site_data = crawler.crawl

      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url
    end

    def test_repubblica
      crawler = Crawler.new(:repubblica)
      site_data = crawler.crawl

      assert_kind_of Ecco::SiteData, site_data
      assert_kind_of String, site_data.headline
      assert_kind_of String, site_data.description
      assert_kind_of URI, site_data.link
      assert_kind_of URI, site_data.image_url

    end
  end
end
