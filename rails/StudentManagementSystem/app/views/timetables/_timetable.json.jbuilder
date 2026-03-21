json.extract! timetable, :id, :class_subject_id, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
