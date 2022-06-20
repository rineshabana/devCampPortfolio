Rails.application.routes.draw do
  resources :portfolios , except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about' ,to: 'pages#about'
  get 'asdf',to: 'pages#contact'
  get 'ror', to: 'portfolios#ror'
  resources :blogs do
     member do
      get :toggle_status
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
