require 'rss'

class Subscription < ApplicationRecord
    include ActionView::RecordIdentifier
    has_and_belongs_to_many :tags
    attr_accessor :rss

    # Broadcast this subscription over the action cable
    # rss has to be set
    def broadcast
        SubscriptionsChannel.broadcast_replace_to(
            :subscriptions,
            target: dom_id(self),
            partial: 'feed/subscription',
            locals: { sub: self }
        )
    end

    # Broadcast a failure to retrieve this subscription
    def broadcast_failure exception
        SubscriptionsChannel.broadcast_replace_to(
            :subscriptions,
            target: dom_id(self),
            partial: 'feed/subscription_failed',
            locals: { sub: self, exception: exception }
          )
    end

end
