Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    resources :users, only: %i[create]
    resource :session, only: %i[create destory]
    resources :microposts, only: %i[index show create update destroy]
  end
end
