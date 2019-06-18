Rails.application.routes.draw do
  # User routes
  get '/user', to: 'users#show'
  post '/signup', to: 'users#create'

  # Auth routes
  get '/auto_login', to: 'auth#auto_login'
  post '/login', to: 'auth#login'

  # Report routes
  get '/report', to: 'reports#show'
  post '/new_report', to: 'reports#create'
  get '/reports', to: 'reports#index'
  post '/report_vote', to: 'reports#vote'
  get '/report_by_state', to: 'reports#report_by_state'
  post '/add_comment', to: 'reports#new_comment'
end
