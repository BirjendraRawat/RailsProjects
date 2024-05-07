Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/help'
  get 'welcome/contact_us'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
