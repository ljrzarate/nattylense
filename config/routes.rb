Rails.application.routes.draw do
  devise_for :users
  root "homes#index"

  namespace :admin do
    resources :posts do
      delete :image, on: :member, action: :destroy_image
    end
    resources :presets
    root to: "posts#index"
  end

  resource :home do
    collection do
      get :search
    end
  end
  resources :presets
  resources :payments, only:[:new, :create]
end
