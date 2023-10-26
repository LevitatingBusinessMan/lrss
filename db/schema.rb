# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_26_135615) do
  create_table "items", primary_key: "link", id: :string, force: :cascade do |t|
    t.boolean "seen"
    t.integer "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_items_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions_tags", id: false, force: :cascade do |t|
    t.integer "subscription_id", null: false
    t.integer "tag_id", null: false
    t.index ["subscription_id", "tag_id"], name: "index_subscriptions_tags_on_subscription_id_and_tag_id"
    t.index ["tag_id", "subscription_id"], name: "index_subscriptions_tags_on_tag_id_and_subscription_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "webhook_requests", force: :cascade do |t|
    t.string "webhook_id", limit: 36, null: false
    t.text "body"
    t.text "headers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["webhook_id"], name: "index_webhook_requests_on_webhook_id"
  end

  create_table "webhooks", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "subscriptions"
  add_foreign_key "webhook_requests", "webhooks"
end
