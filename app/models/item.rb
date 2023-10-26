class Item < ApplicationRecord
  belongs_to :subscription

  def see
    self.seen = true
    self.save
  end

end
