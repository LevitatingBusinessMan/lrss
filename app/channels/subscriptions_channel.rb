class SubscriptionsChannel < ApplicationCable::Channel
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    stream_from "subscriptions"

    # Download all subscriptions and broadcast them
    @subscriptions = Subscription.all
		for sub in @subscriptions
			DownloadFeedJob.perform_later sub
		end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
