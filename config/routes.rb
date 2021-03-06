Rails.application.routes.draw do
  root to: 'static_pages#landing'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resources :reviews, except: [:index, :show, :new]
  end
end
