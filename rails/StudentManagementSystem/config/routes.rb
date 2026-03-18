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

  resources :students
  resources :school_classes
  resources :subjects
  resources :locations

  get "up" => "rails/health#show", as: :rails_health_check

end
