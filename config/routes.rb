Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "questions#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]
  resources :questions do
    resources :comments
    collection do
      post :confirm
    end
    member do
      get :change_resolved
    end
  end
end
