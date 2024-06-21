Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "company" => 'companies#show'
  post "company/create" => 'companies#create'
  put "company/update" => 'companies#update'
  delete "company/delete" => 'companies#destroy'
end
