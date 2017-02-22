module Ecco
  # JOB: Represent Site Data that we need.
  class SiteData
    attr_reader :headline, :description, :link, :image_url

    def initialize(args)
      @headline     = args[:headline]
      @description  = args[:description]
      @link         = args[:link]
      @image_url    = args[:image_url]
    end
  end
end
