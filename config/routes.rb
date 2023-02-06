Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "top#index"
  get "top/about"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users, only: %i[show index] do
    member do
      get :expert_show
    end
  end
  resources :notes do
    collection do
      get :search
    end
    member do
      get :category_search
    end
  end
  resources :knowledges do
    resources :comments do
      get :choose_answer
    end
    collection do
      post :confirm
      get :search
      get :by_disease
      get :by_drug
      get :by_side_effect
      get :my
      get :tag_index
      get :expert_view_index
    end
    member do
      get :change_resolved
    end
  end
  resources :favorites, only: %i[create destroy index]
  resources :categories
end
