class FeedController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end
end
