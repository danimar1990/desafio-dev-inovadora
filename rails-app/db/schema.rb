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

ActiveRecord::Schema[7.0].define(version: 2022_06_08_190037) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string "weight"
    t.string "shortname"
    t.string "name"
    t.string "cfa_url"
    t.string "vetstreet_url"
    t.string "vcahospitals_url"
    t.string "temperament"
    t.string "origin"
    t.string "country_codes"
    t.string "country_code"
    t.string "description"
    t.string "life_span"
    t.integer "indoor"
    t.integer "lap"
    t.string "alt_names"
    t.integer "adaptability"
    t.integer "affection_level"
    t.integer "child_friendly"
    t.integer "dog_friendly"
    t.integer "energy_level"
    t.integer "grooming"
    t.integer "health_issues"
    t.integer "intelligence"
    t.integer "shedding_level"
    t.integer "social_needs"
    t.integer "stranger_friendly"
    t.integer "vocalisation"
    t.integer "experimental"
    t.integer "hairless"
    t.integer "natural"
    t.integer "rare"
    t.integer "rex"
    t.integer "suppressed_tail"
    t.integer "short_legs"
    t.string "wikipedia_url"
    t.integer "hypoallergenic"
    t.string "reference_image_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
