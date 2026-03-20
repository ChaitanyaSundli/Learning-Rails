Rails.application.routes.draw do

  resources :departments do
    resources :teachers, only: [:index]
  end

  resources :teachers do
    resources :timetables, only: [:index]
    resources :clubs, only: [:index]
  end

  resources :school_classes do
    resources :students, only: [:index]
    resources :class_subjects, only: [:index]
    resources :subjects, only: [:index]
    resources :timetables, only: [:index]
    resources :attendances, only: [:index]
  end

  resources :students do
    resources :get_timetable,only: [:index]
    resources :attendances, only: [:index]
    resources :exam_results, only: [:index]
    resources :clubs, only: [:index]
  end

  resources :subjects do
    resources :class_subjects, only: [:index]
    resources :exams, only: [:index]
  end

  resources :class_subjects do
    resources :timetables, only: [:index]
  end

  resources :timetables

  resources :attendances

  resources :exams do
    resources :exam_results, only: [:index]
  end

  resources :exam_results

  resources :clubs do
    resources :club_members, only: [:index]
    resources :students, only: [:index]
    resources :club_schedules, only: [:index]
  end

  resources :club_members

  resources :club_schedules

  resources :locations do
    resources :club_schedules, only: [:index]
  end

  get 'students/:id/timetable', to: 'students#get_timetable'
  get 'school_classes/:id/timetable', to: 'school_classes#get_timetable'

  resources :students
  resources :school_classes
  resources :subjects
  resources :locations


  get "up", to: ->(env) { [200, {}, [{ status: "OK", message: "Chal rha hai Server" }.to_json]] }
  match "*unmatched", to: "application#route_not_found", via: :all

end
