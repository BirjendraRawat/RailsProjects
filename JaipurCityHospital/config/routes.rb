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
  # root 'users/sign_in'
  get 'welcome/index'
  get '/about', to: 'welcome#about'
  get '/help', to: 'welcome#help'
  get '/contact', to: 'welcome#contact_us'
  delete '/logout', to: 'users#destroy'
  resources :doctors
  resources :patients
  resources :users
  # put 'patient/:id/edit', to: 'patient#edit', as: 'patient_edit'
  # get '/doctor_add', to: 'doctors#new'
  # get '/patient_add', to: 'patients#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
