Rails.application.routes.draw do
  resources :authentications
  resources :registrations
  resources :issues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
