class DownloadFeedJob < ApplicationJob
  include ActionView::RecordIdentifier
  queue_as :default

  def perform sub
    begin
      sub.get_rss
      SubscriptionsChannel.broadcast_replace_to(
        :subscriptions,
        target: dom_id(sub),
        partial: 'feed/subscription',
        locals: { sub: sub }
      )
    rescue OpenURI::HTTPError, Errno::ENOENT => ex
      logger.error "#{sub.name.inspect} failed to download from #{sub.url}: #{ex.inspect}"
      SubscriptionsChannel.broadcast_replace_to(
        :subscriptions,
        target: dom_id(sub),
        partial: 'feed/subscription_failed',
        locals: { sub: sub, exception: ex }
      )
    end
  end
end
