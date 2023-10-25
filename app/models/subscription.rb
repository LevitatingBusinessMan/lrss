require 'rss'
require 'open-uri'

class Subscription < ApplicationRecord
    has_and_belongs_to_many :tags

    def get_rss
        logger.debug "Downloading RSS feed for subscription: #{self.name.inspect}"
        URI.open(self.url) do |xml|
            return RSS::Parser.parse(xml)
        end
    end

    def rss
        if @rss.nil?
          @rss = get_rss
        end
        return @rss
    end
end
