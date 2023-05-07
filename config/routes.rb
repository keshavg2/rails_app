Rails.application.routes.draw do
  get '/forbidden' => 'error#unauthorized'
  get 'referral/index'
  # get 'user/index'
  devise_for :user, controllers: { sessions: 'user/sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # Defines the root path route ("/")
  root "referral#index"
  get 'user/admin' => 'user#admin'
  get 'user/send_email' => 'user#send_email'
  post 'user/send_mail' => 'user#send_mail'
end
