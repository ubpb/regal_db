Rails.application.routes.draw do

  namespace :admin do
    resources :locations, shallow: true do
      resources :shelves, shallow: true do
        resources :segments
      end
    end

    namespace :reports do
      resource :regalreihen, only: [:show, :create], controller: "regalreihen"
      resource :systemstellen, only: [:show, :create], controller: "systemstellen"
    end

    resources :shelf_finder, only: [:index, :create]

    root to: redirect("/admin/locations")
  end

  namespace :api do
    get "/locate/*code", to: "shelf_finder#show", defaults: {format: :json}
    get "/exports/csv", to: "exports#csv", defaults: {format: :txt}
  end

  root to: redirect("/admin")

end
