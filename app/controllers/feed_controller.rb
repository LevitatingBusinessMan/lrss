class FeedController < ApplicationController
  def index
    @subscriptions = Subscription.all
    for sub in @subscriptions
      DownloadFeedJob.perform_later sub
    end
  end
end
