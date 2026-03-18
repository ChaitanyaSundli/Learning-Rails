json.extract! student, :id, :name, :dob, :phone, :address, :SchoolClass_id, :created_at, :updated_at
json.url student_url(student, format: :json)
