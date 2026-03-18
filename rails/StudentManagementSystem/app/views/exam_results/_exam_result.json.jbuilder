json.extract! exam_result, :id, :Student_id, :Exam_id, :marks_obtained, :grade, :created_at, :updated_at
json.url exam_result_url(exam_result, format: :json)
