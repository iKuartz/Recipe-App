Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "foods", to: "foods#index"
  delete "foods/delete", to: "foods#destroy", as: "delete_food"
  post "recipes/:recipe_id/update_access", to: "recipes#update", as: "change_access_for_recipe"
  post "recipes/:recipe_id/ingredient/add", to: "recipes#add", as: "add_ingredient"
  post "recipes/:recipe_id/ingredient/:id", to: "recipes#update_quantity", as: "update_quantity"
  delete "recipes/:recipe_id/delete", to: "recipes#destroy", as: "delete_recipe"
  delete "recipes/:recipe_id/:ingredient_id", to: "recipes#remove_ingredient", as: 'delete_ingredient'
  get "recipes", to: "recipes#index"
  get "recipes/:recipe_id", to: "recipes#show"
  get "public_recipes", to: "recipes#public_recipes"
  get "general_shopping_list", to: "shopping_lists#index"
  get "inventories", to: "inventories#index"
  get "inventories/:inventory_id", to: "inventories#show"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/inventories", to: "inventories#index"

end
