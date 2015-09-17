NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end
  resource :session, only: [:create, :new, :destroy] do
    delete "destroy_all", on: :member
  end
  resources :users, only:  [:create, :new, :destroy]

  root to: redirect("/cats")
end
