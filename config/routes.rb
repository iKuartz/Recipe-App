Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get "foods", to: "foods#index"
get "recipes", to: "recipes#index"
get "recipes/:recipe_id", to: "recipes#show"
get "public_recipes", to: "recipes#public_recipes"
get "general_shopping_list", to: "shopping_lists#index"
get "inventories", to: "inventories#index"
get "inventories/:inventory_id", to: "inventories#show", as: "show_inventory"
delete "inventories/:inventory_id/food/delete/:inventory_food_id", to: "foods#destroy", as: "delete_food"
delete "inventories/:inventory_id/delete", to: "inventories#destroy", as: "delete_inventory"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/inventories", to: "inventories#index"

end
