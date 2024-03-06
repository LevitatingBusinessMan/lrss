require 'rss'
require 'typhoeus'

class DownloadFeedJob < ApplicationJob
  queue_as :default
  
  def perform

    # Download all subscriptions and broadcast them
    hydra = Typhoeus::Hydra.new
    @subscriptions = Subscription.all
    @subscriptions.each do |sub|
      request = Typhoeus::Request.new sub.url
      request.on_complete do |response|
        begin
          raise response.return_message if not response.success?
          logger.debug "Succesfully downloaded RSS feed for subscription: #{sub.name.inspect}"
          xml = response.body
          sub.rss = RSS::Parser.parse(xml)
          sub.broadcast
        rescue Exception => ex
          logger.error "#{sub.name.inspect} failed to download from #{sub.url}: #{ex.inspect}"
          sub.broadcast_failure ex
        end
      end
      hydra.queue request
    end

    logger.debug "Downloading feeds"
    hydra.run

  end
end
