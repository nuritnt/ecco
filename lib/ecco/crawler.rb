module Ecco
  # JOB: Get website data using a specific adapter.
  class Crawler
    attr_reader :adapter

    def initialize(adapter)
      @adapter = Ecco.const_get("#{adapter.to_s.capitalize}Adapter").new
    end

    def crawl
      @adapter.data
    end
  end
end
