Rails.application.routes.draw do
  root "homes#index"

  namespace :admin do
    resources :posts do
      delete :image, on: :member, action: :destroy_image
    end
    root to: "posts#index"
  end

  resource :home do
    collection do
      get :search
    end
  end
end
