class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks, id: false do |t|
      t.text :name
      t.string :id, limit: 36, primary_key: true # UUID

      t.timestamps
    end
  end
end
