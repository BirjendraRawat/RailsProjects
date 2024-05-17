Rails.application.routes.draw do
  get 'doctors/index'
  get 'doctors/show'
  get 'doctors/create'
  get 'doctors/new'
  get 'patients/index'
  get 'patients/show'
  get 'patients/create'
  get 'patients/new'
  devise_for :users
  root 'welcome#home'
  get 'welcome/index'
  get '/about', to: 'welcome#about'
  get '/help', to: 'welcome#help'
  get '/contact', to: 'welcome#contact_us'
  resources :doctors
  resources :patients
  # put 'patient/:id/edit', to: 'patient#edit', as: 'patient_edit'
  get '/login', to: 'doctors#new'
  get '/signin', to: 'patients#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
