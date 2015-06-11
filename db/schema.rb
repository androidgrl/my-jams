
ActiveRecord::Schema.define(version: 20150610212851) do

  enable_extension "plpgsql"

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.text     "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

end
