Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    resources :users, only: %i[create index]
    resource :session, only: %i[create destory]
    resources :microposts, only: %i[index show create update destroy]
    resources :tags, only: %i[index]
    
    namespace :me do
      resource :account, only: %i[update]
    end
  end
end
