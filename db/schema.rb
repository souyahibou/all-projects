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

ActiveRecord::Schema.define(version: 20181115054447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_de_donnees_authors", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_de_donnees_cours", id: :integer, default: nil, force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_de_donnees_lecons", force: :cascade do |t|
    t.string "titre"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_de_donnees_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_base_de_donnees_posts_on_author_id"
  end

  create_table "blog_articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "blog_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_article_id"], name: "index_blog_comments_on_blog_article_id"
  end

  create_table "courses_classes", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students_classes", id: false, force: :cascade do |t|
    t.bigint "courses_classe_id"
    t.bigint "courses_student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_classe_id"], name: "index_courses_students_classes_on_courses_classe_id"
    t.index ["courses_student_id"], name: "index_courses_students_classes_on_courses_student_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "devise_demo_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_devise_demo_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_devise_demo_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_devise_demo_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_devise_demo_users_on_unlock_token", unique: true
  end

  create_table "email_viewer_emails", force: :cascade do |t|
    t.string "object"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventbrite_events", force: :cascade do |t|
    t.text "description"
    t.datetime "date"
    t.string "place"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventbrite_events_users", id: false, force: :cascade do |t|
    t.bigint "eventbrite_event_id"
    t.bigint "eventbrite_user_id"
    t.index ["eventbrite_event_id"], name: "index_eventbrite_events_users_on_eventbrite_event_id"
    t.index ["eventbrite_user_id"], name: "index_eventbrite_events_users_on_eventbrite_user_id"
  end

  create_table "eventbrite_users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formulaire_stylay_users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generate_dogs", force: :cascade do |t|
    t.string "race"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generate_dogsitters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generate_strolls", force: :cascade do |t|
    t.bigint "generate_dogsitter_id"
    t.bigint "generate_dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generate_dog_id"], name: "index_generate_strolls_on_generate_dog_id"
    t.index ["generate_dogsitter_id"], name: "index_generate_strolls_on_generate_dogsitter_id"
  end

  create_table "home_page_gossips", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "moussaillon_id"
  end

  create_table "home_page_moussaillons", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "anonymous_username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_home_page_moussaillons_on_email", unique: true
    t.index ["reset_password_token"], name: "index_home_page_moussaillons_on_reset_password_token", unique: true
  end

  create_table "login_password_full_master_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "movie_maker_movies", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "re_former_users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_appointments", force: :cascade do |t|
    t.datetime "date"
    t.bigint "reservation_doctor_id"
    t.bigint "reservation_patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_doctor_id"], name: "index_reservation_appointments_on_reservation_doctor_id"
    t.index ["reservation_patient_id"], name: "index_reservation_appointments_on_reservation_patient_id"
  end

  create_table "reservation_doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "specialty"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_vol_airports", force: :cascade do |t|
    t.string "airport_code"
    t.string "airport_name"
    t.string "airport_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_vol_airports_flights", id: false, force: :cascade do |t|
    t.bigint "reservation_vol_flight_id", null: false
    t.bigint "reservation_vol_airport_id", null: false
    t.index ["reservation_vol_airport_id", "reservation_vol_flight_id"], name: "index_airports_flights_on_airport_id_and_flight_id"
    t.index ["reservation_vol_flight_id", "reservation_vol_airport_id"], name: "index_airports_flights_on_flight_id_and_airport_id"
  end

  create_table "reservation_vol_bookings", force: :cascade do |t|
    t.string "name"
    t.bigint "reservation_vol_flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_vol_flight_id"], name: "index_reservation_vol_bookings_on_reservation_vol_flight_id"
  end

  create_table "reservation_vol_bookings_passengers", id: false, force: :cascade do |t|
    t.bigint "reservation_vol_passenger_id", null: false
    t.bigint "reservation_vol_booking_id", null: false
    t.index ["reservation_vol_booking_id", "reservation_vol_passenger_id"], name: "index_passengers_bookings_on_booking_id_and_passenger_id"
    t.index ["reservation_vol_passenger_id", "reservation_vol_booking_id"], name: "index_bookings_passengers_on_passenger_id_and_booking_id"
  end

  create_table "reservation_vol_flights", force: :cascade do |t|
    t.integer "duration"
    t.datetime "departure_date"
    t.bigint "departure_airport_id"
    t.bigint "arrival_airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_reservation_vol_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_reservation_vol_flights_on_departure_airport_id"
  end

  create_table "reservation_vol_passengers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_gossip_project_gossips", force: :cascade do |t|
    t.string "anonymous_author"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thp_moussaillons_corsairs", force: :cascade do |t|
    t.string "first_name"
    t.integer "age"
    t.string "likeness"
    t.string "bio"
    t.string "slack_handle"
    t.string "github_handle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "univers_response_users", force: :cascade do |t|
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "usine_assemblies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usine_assemblies_parts", id: false, force: :cascade do |t|
    t.bigint "usine_assembly_id", null: false
    t.bigint "usine_part_id", null: false
  end

  create_table "usine_parts", force: :cascade do |t|
    t.string "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blog_comments", "blog_articles"
  add_foreign_key "courses_students_classes", "courses_classes", column: "courses_classe_id"
  add_foreign_key "courses_students_classes", "courses_students"
  add_foreign_key "generate_strolls", "generate_dogs"
  add_foreign_key "generate_strolls", "generate_dogsitters"
  add_foreign_key "reservation_appointments", "reservation_doctors"
  add_foreign_key "reservation_appointments", "reservation_patients"
  add_foreign_key "reservation_vol_bookings", "reservation_vol_flights"
end
