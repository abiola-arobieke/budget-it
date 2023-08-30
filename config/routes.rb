Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index'
    end
  end

  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :expense_items, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
end
