Rails.application.routes.draw do
  resources :blogs, only: [:index, :show]

  namespace :mypage do
    resources :blogs
  end

  namespace :admin do
    resources :blogs
  end

  devise_for :admin_users, path: 'admin',
    controllers: { sessions: 'admin/sessions' }, only: :session
end
