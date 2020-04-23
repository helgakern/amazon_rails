Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

  get("/", to: "welcome#root")
  get("/about", to: "welcome#about")
  get("/contact_us", to: "welcome#contact_us")
  

end