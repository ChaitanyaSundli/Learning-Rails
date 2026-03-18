json.extract! club_schedule, :id, :Club_id, :activity_type, :schedule_date, :start_time, :end_time, :Location_id, :created_at, :updated_at
json.url club_schedule_url(club_schedule, format: :json)
