Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "foods", to: "foods#index"
  post "recipes/:recipe_id/ingredient/add", to: "recipes#add", as: "add_ingredient"
  post "recipes/:recipe_id/ingredient/:id", to: "recipes#update_quantity", as: "update_quantity"
  delete "recipes/:recipe_id/:ingredient_id", to: "recipes#remove_ingredient", as: 'delete_ingredient'
  get "recipes", to: "recipes#index"
  get "recipes/:recipe_id", to: "recipes#show"
  get "public_recipes", to: "recipes#public_recipes"
  get "general_shopping_list", to: "shopping_lists#index"
  get "inventories", to: "inventories#index"
  get "inventories/:inventory_id", to: "inventories#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
