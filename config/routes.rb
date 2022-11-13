Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "questions#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]
  resources :notes
  resources :questions do
    resources :comments do
      get :choose_answer
    end
    collection do
      post :confirm
      get :search
      get :by_disease
    end
    member do
      get :change_resolved
    end
  end
  resources :favorites, only: %i[create destroy index]
end
