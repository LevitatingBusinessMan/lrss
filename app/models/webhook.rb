class Webhook < ApplicationRecord
  has_many :requests, class_name: :WebhookRequest
  before_create :set_uuid

  def set_uuid
    self.id = SecureRandom.uuid unless self.id
  end
end
