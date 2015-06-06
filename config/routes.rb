Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'dashboard#index'
  end
  root 'home#index'
end
