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

ActiveRecord::Schema[8.1].define(version: 2026_03_18_093532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "class_subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "credit"
    t.bigint "school_class_id", null: false
    t.bigint "subject_id", null: false
    t.string "syllabus"
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_class_subjects_on_school_class_id"
    t.index ["subject_id"], name: "index_class_subjects_on_subject_id"
  end

  create_table "club_members", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.string "role"
    t.string "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_departments_on_teacher_id"
  end

  create_table "exam_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "exam_id", null: false
    t.string "grade"
    t.integer "marks_obtained"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_results_on_exam_id"
    t.index ["student_id"], name: "index_exam_results_on_student_id"
  end

  create_table "exams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.time "end_time"
    t.date "exam_date"
    t.string "exam_type"
    t.integer "max_mark"
    t.integer "pass_mark"
    t.time "start_time"
    t.bigint "subject_id", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "grade_lvl"
    t.bigint "location_id", null: false
    t.string "section"
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_school_classes_on_location_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.date "dob"
    t.string "name"
    t.string "phone"
    t.bigint "school_class_id", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "department_id", null: false
    t.date "dob"
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "day"
    t.time "end_time"
    t.bigint "school_class_id", null: false
    t.time "start_time"
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_timetables_on_school_class_id"
    t.index ["subject_id"], name: "index_timetables_on_subject_id"
    t.index ["teacher_id"], name: "index_timetables_on_teacher_id"
  end

  add_foreign_key "attendances", "students"
  add_foreign_key "class_subjects", "school_classes"
  add_foreign_key "class_subjects", "subjects"
  add_foreign_key "club_members", "clubs"
  add_foreign_key "club_members", "students"
  add_foreign_key "club_schedules", "clubs"
  add_foreign_key "club_schedules", "locations"
  add_foreign_key "clubs", "teachers"
  add_foreign_key "departments", "teachers"
  add_foreign_key "exam_results", "exams"
  add_foreign_key "exam_results", "students"
  add_foreign_key "exams", "subjects"
  add_foreign_key "school_classes", "locations"
  add_foreign_key "students", "school_classes"
  add_foreign_key "teachers", "departments"
  add_foreign_key "timetables", "school_classes"
  add_foreign_key "timetables", "subjects"
  add_foreign_key "timetables", "teachers"
end
