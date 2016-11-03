Rails.application.routes.draw do
  root 'admin#dashboard'
  namespace :admin do
    get :dashboard
    resources :blogs
  end
end
