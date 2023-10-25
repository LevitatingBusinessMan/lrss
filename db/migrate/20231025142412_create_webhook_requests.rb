class CreateWebhookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_requests do |t|
      t.references :webhook, type: :string, limit: 36, null: false, foreign_key: true
      t.text :body
      t.text :headers

      t.timestamps
    end
  end
end
