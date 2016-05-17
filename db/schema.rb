ActiveRecord::Schema.define(version: 20160517095522) do
  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end
  add_index "users", ["email"], name: "index_users_on_email", unique: true
end
