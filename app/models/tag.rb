class Tag < ApplicationRecord
    has_and_belongs_to_many :subscriptions

    def to_s
        return self.name
    end
end
