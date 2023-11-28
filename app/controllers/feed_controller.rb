class FeedController < ApplicationController
  def index
    @subscriptions = Subscription.all
    # Background jobs are started by channel
  end
end
