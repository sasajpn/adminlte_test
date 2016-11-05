Rails.application.routes.draw do
  root 'user#home'
  namespace :admin do
    resources :blogs
  end
  namespace :user do
    resources :blogs
  end
end
