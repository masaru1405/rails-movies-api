Rails.application.routes.draw do
  root "home#index"

  get '/search', to: 'search#index'
  get '/movies', to: 'search#list_movies'
  get '/persons', to: 'search#list_persons'
  get '/index_persons', to: 'search#index_person'

  get '/networks', to: 'networks#index'
  get '/collections', to: 'collections#index'
  get '/keywords', to: 'keywords#index'
  get '/companies', to: 'companies#index'
  get '/tvs', to: 'tvs#index'
  get '/persons', to: 'persons#index'
  get '/movies', to: "movies#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
