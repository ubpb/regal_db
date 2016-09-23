Rails.application.routes.draw do

  namespace :admin do
    resources :locations, shallow: true do
      resources :shelves, shallow: true do
        resources :segments
      end
    end

    get "shelf-finder", to: "shelf_finder#index", as: :shelf_finder

    root to: redirect("/admin/locations")
  end

  root to: redirect("/admin")

end
