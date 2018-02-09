Rails.application.routes.draw do

  resources :students
  resources :student_enrollments
  get '/api/students', to: "students#index"
  get '/api/Account/info', to: "students#show_current_student"
  post '/api/Account/Register', to: "students#create"
  get '/api/students/:id', to: "students#show"
  get '/api/courses', to: "courses#index"
  post '/token', to: "sessions#create"
  post '/api/students/enroll', to: "student_enrollments#create"
  post '/api/students/unenroll', to: "student_enrollments#delete"
  root 'students#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
