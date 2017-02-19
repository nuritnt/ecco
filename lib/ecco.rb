require 'pry'
require 'uri'
require 'curb'
require 'nokogiri'

require_relative 'ecco/crawler.rb'
require_relative 'ecco/site_data.rb'
require_relative 'ecco/adapter.rb'

require_relative 'ecco/adapters/lemonde.rb'
require_relative 'ecco/adapters/nzz.rb'
require_relative 'ecco/adapters/guardian.rb'
require_relative 'ecco/adapters/repubblica.rb'
require_relative 'ecco/adapters/daily_mail.rb'

module Ecco
end
