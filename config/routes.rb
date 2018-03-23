Rails.application.routes.draw do

  root :to => 'pages#home'


	devise_for :users,
	         path: '',
	         path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
	         controllers: {registrations: 'registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] #editがいらないのは、deviseで編集できるから。

  resources :rooms, except: [:edit] do
    member do
      get 'basic'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'youtube'
      get 'personalinfo'
      get 'teacher'
      get 'teacherinfo'
    end
    resources :reservations, only: [:create]
  end

  # 先生と生徒だけが見れるように。
  resources :reservations, only: [:show]

  get '/advices' => 'reservations#advices'
  get '/reservations' => 'reservations#reservations'  

  resources :teacher_reviews, only: [:create, :destroy]
  resources :student_reviews, only: [:create, :destroy]
  


  resources :roomphotos, only: [:create, :destroy] do
    collection do
      get :list 
    end
  end

end
