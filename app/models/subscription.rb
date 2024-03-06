require 'rss'
require 'open-uri'

include UriHelper

class Subscription < ApplicationRecord
    has_and_belongs_to_many :tags

    def get_rss
        logger.debug "Downloading RSS feed for subscription: #{self.name.inspect}"
        xml = open_cached(self.url)
        @rss = RSS::Parser.parse(xml)
        return @rss
    end

    def rss
        return @rss
    end
end
