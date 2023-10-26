class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: false do |t|
      t.string :link, primary_key: true
      t.boolean :seen
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
