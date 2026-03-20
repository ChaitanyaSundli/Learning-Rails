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

ActiveRecord::Schema[8.1].define(version: 2026_03_20_211950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "academic_years", force: :cascade do |t|
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.date "end_date"
    t.string "name", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.datetime "created_at", null: false
    t.date "date"
    t.string "status"
    t.bigint "student_id", null: false
    t.bigint "time_slot_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_attendances_on_academic_year_id"
    t.index ["student_id", "date", "time_slot_id"], name: "index_unique_attendance", unique: true
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["time_slot_id"], name: "index_attendances_on_time_slot_id"
  end

  create_table "class_subjects", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.datetime "created_at", null: false
    t.integer "credit"
    t.bigint "school_class_id", null: false
    t.bigint "subject_id", null: false
    t.string "syllabus"
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_class_subjects_on_academic_year_id"
    t.index ["school_class_id", "subject_id", "academic_year_id"], name: "index_unique_class_subject", unique: true
    t.index ["school_class_id"], name: "index_class_subjects_on_school_class_id"
    t.index ["subject_id"], name: "index_class_subjects_on_subject_id"
  end

  create_table "club_members", force: :cascade do |t|
    t.bigint "academic_year_id"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.string "role"
    t.string "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_club_members_on_academic_year_id"
    t.index ["club_id"], name: "index_club_members_on_club_id"
    t.index ["student_id"], name: "index_club_members_on_student_id"
  end

  create_table "club_schedules", force: :cascade do |t|
    t.string "activity_type"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.time "end_time"
    t.bigint "location_id", null: false
    t.date "schedule_date"
    t.time "start_time"
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_schedules_on_club_id"
    t.index ["location_id"], name: "index_club_schedules_on_location_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_clubs_on_teacher_id"
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.datetime "created_at", null: false
    t.bigint "school_class_id", null: false
    t.string "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_enrollments_on_academic_year_id"
    t.index ["school_class_id"], name: "index_enrollments_on_school_class_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.bigint "academic_year_id"
    t.datetime "created_at", null: false
    t.bigint "exam_id", null: false
    t.string "grade"
    t.integer "marks_obtained"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_exam_results_on_academic_year_id"
    t.index ["exam_id"], name: "index_exam_results_on_exam_id"
    t.index ["student_id"], name: "index_exam_results_on_student_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.bigint "class_subject_id", null: false
    t.datetime "created_at", null: false
    t.date "exam_date"
    t.string "exam_type"
    t.integer "max_mark"
    t.integer "pass_mark"
    t.bigint "time_slot_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_exams_on_academic_year_id"
    t.index ["class_subject_id"], name: "index_exams_on_class_subject_id"
    t.index ["time_slot_id"], name: "index_exams_on_time_slot_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "building"
    t.datetime "created_at", null: false
    t.string "floor"
    t.string "location_type"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", force: :cascade do |t|
    t.bigint "academic_year_id"
    t.datetime "created_at", null: false
    t.integer "grade_lvl"
    t.bigint "location_id", null: false
    t.string "section"
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_school_classes_on_academic_year_id"
    t.index ["location_id"], name: "index_school_classes_on_location_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.date "dob"
    t.string "name"
    t.string "password"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "teacher_assignments", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.bigint "class_subject_id", null: false
    t.datetime "created_at", null: false
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_teacher_assignments_on_academic_year_id"
    t.index ["class_subject_id", "academic_year_id"], name: "index_one_teacher_per_subject_per_year", unique: true
    t.index ["class_subject_id"], name: "index_teacher_assignments_on_class_subject_id"
    t.index ["teacher_id"], name: "index_teacher_assignments_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "department_id", null: false
    t.date "dob"
    t.string "email"
    t.boolean "is_hod"
    t.string "name"
    t.string "password"
    t.string "phone"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.time "end_time"
    t.string "name"
    t.integer "position"
    t.time "start_time"
    t.datetime "updated_at", null: false
  end

  create_table "timetables", force: :cascade do |t|
    t.bigint "academic_year_id", null: false
    t.bigint "class_subject_id", null: false
    t.datetime "created_at", null: false
    t.string "day_of_week", null: false
    t.bigint "time_slot_id", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_timetables_on_academic_year_id"
    t.index ["class_subject_id", "day_of_week", "time_slot_id", "academic_year_id"], name: "index_unique_class_schedule", unique: true
    t.index ["class_subject_id"], name: "index_timetables_on_class_subject_id"
    t.index ["day_of_week", "time_slot_id", "academic_year_id"], name: "index_time_lookup"
    t.index ["time_slot_id"], name: "index_timetables_on_time_slot_id"
  end

  add_foreign_key "attendances", "academic_years"
  add_foreign_key "attendances", "students"
  add_foreign_key "attendances", "time_slots"
  add_foreign_key "class_subjects", "academic_years"
  add_foreign_key "class_subjects", "school_classes"
  add_foreign_key "class_subjects", "subjects"
  add_foreign_key "club_members", "academic_years"
  add_foreign_key "club_members", "clubs"
  add_foreign_key "club_members", "students"
  add_foreign_key "club_schedules", "clubs"
  add_foreign_key "club_schedules", "locations"
  add_foreign_key "clubs", "teachers"
  add_foreign_key "enrollments", "academic_years"
  add_foreign_key "enrollments", "school_classes"
  add_foreign_key "enrollments", "students"
  add_foreign_key "exam_results", "academic_years"
  add_foreign_key "exam_results", "exams"
  add_foreign_key "exam_results", "students"
  add_foreign_key "exams", "academic_years"
  add_foreign_key "exams", "class_subjects"
  add_foreign_key "exams", "time_slots"
  add_foreign_key "school_classes", "academic_years"
  add_foreign_key "school_classes", "locations"
  add_foreign_key "teacher_assignments", "academic_years"
  add_foreign_key "teacher_assignments", "class_subjects"
  add_foreign_key "teacher_assignments", "teachers"
  add_foreign_key "teachers", "departments"
  add_foreign_key "timetables", "academic_years"
  add_foreign_key "timetables", "class_subjects"
  add_foreign_key "timetables", "time_slots"
end
