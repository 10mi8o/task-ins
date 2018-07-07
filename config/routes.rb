Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'users#new'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]
  resources :favorites, only:[:index, :create, :destroy]
end
