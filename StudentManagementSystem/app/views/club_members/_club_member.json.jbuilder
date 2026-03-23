json.extract! club_member, :id, :student_id, :club_id, :role, :status, :created_at, :updated_at
json.url club_member_url(club_member, format: :json)
