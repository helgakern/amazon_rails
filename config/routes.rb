Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  # get "/products/new" => "products#new", as: :new_product
  # post "/products" => "products#create", as: :products
  # get "/products/:id" => "products#show", as: :product 
  # get "/products" => "products#index"
  # delete "/products/:id" => "products#destroy"
  # get "/products/:id/edit" => "products#edit", as: :edit_product
  # patch "/products/:id" => "products#update"
  
  resources :products do
    # creates the following route for us:
    # post('/products/:product_id/reviews, { to: 'reviews#create', as: :product_reviews })
    # which, due to the 'as' creates a method called 'product_reviews_path' 
    # This method requires one variable, a product or product id to 'fill in'
    # the value for ':product_id', in the path it returns 
    # the value: '/products/:product_id/reviews' with the :product_id 
    # "filled in"
    # Shallow: https://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html#method-i-resources
    resources :reviews, shallow: true,  only: [:create, :destroy]
  end
end
