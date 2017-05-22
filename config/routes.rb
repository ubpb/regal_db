Rails.application.routes.draw do

  namespace :admin do
    resources :locations, shallow: true do
      resources :shelves, shallow: true do
        resources :segments
      end
    end

    namespace :reports do
      resources :regalreihen, only: [:index, :create]
      resources :systemstellen, only: [:index, :create]
    end

    get "shelf-finder", to: "shelf_finder#index", as: :shelf_finder

    root to: redirect("/admin/locations")
  end

  namespace :api do
    get "/locate/*code", to: "shelf_finder#show", defaults: {format: :json}
    get "/exports/csv", to: "exports#csv", defaults: {format: :txt}
  end

  root to: redirect("/admin")

end
