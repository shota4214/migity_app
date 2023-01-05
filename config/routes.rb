Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "top#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users, only: %i[show index] do
    member do
      get :specialty_pharmacist_show
    end
  end
  resources :notes do
    collection do
      get :search
    end
  end
  resources :questions do
    resources :comments do
      get :choose_answer
    end
    collection do
      post :confirm
      get :search
      get :by_disease
      get :my
    end
    member do
      get :change_resolved
    end
  end
  resources :favorites, only: %i[create destroy index]
end
