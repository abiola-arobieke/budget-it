Rails.application.routes.draw do
  # get 'home/index'
  # get 'expense_items/index'
  # get 'expense_items/show'
  # get 'expense_items/new'
  # get 'expense_items_categories/index'
  # get 'expense_items_categories/show'
  # get 'expense_items_categories/new'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "home#index"
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index'
    end
  end
  #If no route matches
  
  # match '*path', via: :all, to: redirect('/404')

  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :expense_items, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
end
