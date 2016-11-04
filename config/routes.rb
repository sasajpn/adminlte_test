Rails.application.routes.draw do
  root 'admin#dashboard'
  namespace :admin do
    get :dashboard
    resources :blogs
  end

  namespace :user do
    resources :blogs
  end
end
