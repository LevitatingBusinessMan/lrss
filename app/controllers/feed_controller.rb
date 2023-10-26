class FeedController < ApplicationController
  def index
    @subscriptions = Subscription.all
    @subscriptions.each(&:fetch)
  end
end
