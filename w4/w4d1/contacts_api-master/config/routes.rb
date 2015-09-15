Rails.application.routes.draw do
  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :contact_shares, only: [:create, :destroy]

  resources :users do
    resources :contacts, only: :index
    resources :groups, only: [:index, :show, :destroy, :update, :create]
    member do
      get 'favorites' => 'contacts#favorites'
    end
    resources :comments, only: :index
  end

  resources :contacts do
    resources :comments, only: :index
  end

end
