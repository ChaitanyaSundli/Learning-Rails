Rails.application.routes.draw do
  resources :club_schedules
  resources :club_members
  resources :clubs
  resources :exam_results
  resources :exams
  resources :attendances
  resources :timetables
  resources :class_subjects
  resources :teachers
  resources :departments
  resources :students
  resources :school_classes
  resources :subjects
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

end
