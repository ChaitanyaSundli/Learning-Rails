json.extract! teacher, :id, :name, :dob, :phone, :email, :department_id, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
