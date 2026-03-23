json.extract! exam, :id, :class_subject_id, :exam_type, :exam_date, :start_time, :end_time, :max_mark, :pass_mark, :created_at, :updated_at
json.url exam_url(exam, format: :json)
