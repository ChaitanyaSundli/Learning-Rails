Rails.application.routes.draw do

  resources :departments do
    resources :teachers, only: [:index]
  end

  resources :teachers do
    resources :timetables, only: [:index]
    resources :clubs, only: [:index]

    collection do
      get :students_with_poor_performance
      get :classwise_top_5_absentees
      get :teacher_performance
    end

    member do
      get :dashboard
    end
  end

  resources :school_classes do
    resources :students, only: [:index]
    resources :class_subjects, only: [:index]
    resources :subjects, only: [:index]
    resources :timetables, only: [:index]
    resources :attendances, only: [:index]

    member do
      get :timetable
    end
  end

  resources :students do
    resources :attendances, only: [:index]
    resources :exam_results, only: [:index]
    resources :clubs, only: [:index]

    collection do
      get :login
    end

    member do
      get :timetable
      get :dashboard
    end
  end

  resources :subjects do
    resources :class_subjects, only: [:index]
    resources :exams, only: [:index]
  end

  resources :class_subjects do
    resources :timetables, only: [:index]
  end

  resources :timetables do
    collection do
      get :available_teachers
      get :available_class_subjects
      get :class_view
    end
  end

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

    collection do
      get :available
    end
  end

  resources :enrollments

  post "/login", to: "auth#login"
  get "up", to: ->(env) { [200, {}, [{ status: "OK", message: "Chal rha hai Server" }.to_json]] }
  match "*unmatched", to: "application#route_not_found", via: :all

end