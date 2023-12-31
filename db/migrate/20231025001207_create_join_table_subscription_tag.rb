class CreateJoinTableSubscriptionTag < ActiveRecord::Migration[7.0]
  def change
    create_join_table :subscriptions, :tags do |t|
      t.index [:subscription_id, :tag_id]
      t.index [:tag_id, :subscription_id]
    end
  end
end
