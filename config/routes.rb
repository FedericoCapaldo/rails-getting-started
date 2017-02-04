Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  root 'welcome#index' #calling controller welcome with action index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
