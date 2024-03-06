class SubscriptionsChannel < ApplicationCable::Channel
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    stream_from "subscriptions"
    DownloadFeedJob.perform_later
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
