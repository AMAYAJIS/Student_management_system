Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/students/search', to: 'students#search', as: 'students_search'
  post '/students/generate_report', to: 'students#generate_report', as: 'generate_report_students'
  resources :students



end
