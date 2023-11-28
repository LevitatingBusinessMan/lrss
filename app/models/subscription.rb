require 'rss'
require 'open-uri'

class Subscription < ApplicationRecord
    has_and_belongs_to_many :tags

    def get_rss
        logger.debug "Downloading RSS feed for subscription: #{self.name.inspect}"
        URI.open(self.url) do |xml|
            logger.debug "Downloaded #{self.name.inspect} from #{self.url}"
            @rss = RSS::Parser.parse(xml)
            return @rss
        end
    end

    def rss
        return @rss
    end
end
