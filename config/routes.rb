Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User routes
  get '/user', to: 'users#show'
  post '/new_user', to: 'users#create'
  post '/auth', to: 'auth#create'

  # Report routes
  get '/report', to: 'reports#show'
  post '/new_report', to: 'reports#create'
  get '/reports', to: 'reports#index'

end

