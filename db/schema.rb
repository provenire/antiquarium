# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150221125648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "affiliations", force: :cascade do |t|
    t.uuid     "uuid",        default: "uuid_generate_v4()"
    t.string   "slug",                                       null: false
    t.string   "name",                                       null: false
    t.text     "description", default: ""
    t.integer  "person_id"
    t.integer  "place_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",     default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "affiliations", ["person_id"], name: "index_affiliations_on_person_id", using: :btree
  add_index "affiliations", ["place_id"], name: "index_affiliations_on_place_id", using: :btree

  create_table "annotations", force: :cascade do |t|
    t.uuid     "uuid",        default: "uuid_generate_v4()"
    t.integer  "page_id"
    t.integer  "tagged_id"
    t.string   "tagged_type"
    t.string   "name",        default: "",                   null: false
    t.text     "description", default: ""
    t.json     "location"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "annotations", ["page_id"], name: "index_annotations_on_page_id", using: :btree
  add_index "annotations", ["tagged_type", "tagged_id"], name: "index_annotations_on_tagged_type_and_tagged_id", using: :btree

  create_table "artifacts", force: :cascade do |t|
    t.uuid     "uuid",            default: "uuid_generate_v4()"
    t.string   "slug",                                           null: false
    t.string   "name",                                           null: false
    t.text     "description"
    t.string   "alternate_names", default: [],                   null: false, array: true
    t.string   "artist"
    t.string   "dimensions"
    t.string   "date_created"
    t.boolean  "group",           default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "artifacts", ["alternate_names"], name: "index_artifacts_on_alternate_names", using: :btree
  add_index "artifacts", ["group"], name: "index_artifacts_on_group", using: :btree
  add_index "artifacts", ["slug"], name: "index_artifacts_on_slug", unique: true, using: :btree
  add_index "artifacts", ["uuid"], name: "index_artifacts_on_uuid", unique: true, using: :btree

  create_table "artifacts_events", id: false, force: :cascade do |t|
    t.integer "artifact_id", null: false
    t.integer "event_id",    null: false
  end

  add_index "artifacts_events", ["artifact_id", "event_id"], name: "index_artifacts_events_on_artifact_id_and_event_id", using: :btree
  add_index "artifacts_events", ["event_id", "artifact_id"], name: "index_artifacts_events_on_event_id_and_artifact_id", using: :btree

  create_table "citations", force: :cascade do |t|
    t.integer  "source_id"
    t.integer  "entry_id"
    t.string   "entry_type"
    t.integer  "number"
    t.string   "content",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "citations", ["entry_type", "entry_id"], name: "index_citations_on_entry_type_and_entry_id", using: :btree
  add_index "citations", ["source_id"], name: "index_citations_on_source_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "events", force: :cascade do |t|
    t.uuid     "uuid",           default: "uuid_generate_v4()"
    t.string   "slug",                                          null: false
    t.string   "name",                                          null: false
    t.text     "description",    default: ""
    t.date     "date"
    t.string   "status"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "price_cents",    default: 0,                    null: false
    t.string   "price_currency", default: "USD",                null: false
    t.boolean  "failed",         default: false,                null: false
    t.integer  "verb_id"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["status"], name: "index_events_on_status", using: :btree
  add_index "events", ["uuid"], name: "index_events_on_uuid", unique: true, using: :btree
  add_index "events", ["verb_id"], name: "index_events_on_verb_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "interactions", force: :cascade do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "event_id"
    t.boolean  "recipient",     default: true,  null: false
    t.boolean  "unknown_actor", default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "interactions", ["actor_type", "actor_id"], name: "index_interactions_on_actor_type_and_actor_id", using: :btree
  add_index "interactions", ["event_id"], name: "index_interactions_on_event_id", using: :btree
  add_index "interactions", ["recipient"], name: "index_interactions_on_recipient", using: :btree
  add_index "interactions", ["unknown_actor"], name: "index_interactions_on_unknown_actor", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "source_id"
    t.integer  "number"
    t.text     "text"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["number"], name: "index_pages_on_number", using: :btree
  add_index "pages", ["source_id", "number"], name: "index_pages_on_source_id_and_number", unique: true, using: :btree
  add_index "pages", ["source_id"], name: "index_pages_on_source_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.uuid     "uuid",          default: "uuid_generate_v4()"
    t.string   "slug",                                         null: false
    t.string   "name",                                         null: false
    t.text     "description",   default: ""
    t.string   "gender",        default: "unknown",            null: false
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.string   "nationality",   default: "unknown",            null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "people", ["slug"], name: "index_people_on_slug", unique: true, using: :btree
  add_index "people", ["uuid"], name: "index_people_on_uuid", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.uuid     "uuid",        default: "uuid_generate_v4()"
    t.string   "slug",                                       null: false
    t.string   "name",                                       null: false
    t.text     "description", default: ""
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "places", ["slug"], name: "index_places_on_slug", unique: true, using: :btree
  add_index "places", ["uuid"], name: "index_places_on_uuid", unique: true, using: :btree

  create_table "sources", force: :cascade do |t|
    t.uuid     "uuid",         default: "uuid_generate_v4()"
    t.string   "slug",                                        null: false
    t.string   "kind",         default: "document",           null: false
    t.string   "name",                                        null: false
    t.text     "description",  default: ""
    t.string   "authors",      default: ""
    t.date     "date_created"
    t.string   "attribution",  default: ""
    t.string   "image"
    t.string   "document"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "identifier"
  end

  add_index "sources", ["attribution"], name: "index_sources_on_attribution", using: :btree
  add_index "sources", ["authors"], name: "index_sources_on_authors", using: :btree
  add_index "sources", ["identifier"], name: "index_sources_on_identifier", using: :btree
  add_index "sources", ["kind"], name: "index_sources_on_kind", using: :btree
  add_index "sources", ["slug"], name: "index_sources_on_slug", unique: true, using: :btree
  add_index "sources", ["uuid"], name: "index_sources_on_uuid", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                          null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.string   "name",                            default: "",                   null: false
    t.string   "slug",                                                           null: false
    t.string   "description",                     default: ""
    t.uuid     "uuid",                            default: "uuid_generate_v4()"
    t.string   "company"
    t.string   "location"
    t.string   "role",                            default: "user",               null: false
    t.integer  "login_count",                     default: 0,                    null: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "verbs", force: :cascade do |t|
    t.string   "keyword",                                                     null: false
    t.string   "action",                                                      null: false
    t.string   "noun",                                                        null: false
    t.string   "components",      default: ["date", "status", "description"], null: false, array: true
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "subject_types",   default: ["people", "places"],                           array: true
    t.integer  "subject_limit"
    t.string   "recipient_types", default: ["people", "places"],                           array: true
    t.integer  "recipient_limit"
  end

  add_index "verbs", ["action"], name: "index_verbs_on_action", unique: true, using: :btree
  add_index "verbs", ["keyword"], name: "index_verbs_on_keyword", unique: true, using: :btree
  add_index "verbs", ["noun"], name: "index_verbs_on_noun", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
