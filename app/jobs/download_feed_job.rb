class DownloadFeedJob < ApplicationJob
  include ActionView::RecordIdentifier
  queue_as :default

  def perform sub
    sub.get_rss
    Turbo::StreamsChannel.broadcast_replace_to(
      :subscriptions,
      target: dom_id(sub),
      partial: 'feed/subscription',
      locals: { sub: sub }
    )
  end
end
