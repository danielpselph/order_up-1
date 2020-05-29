Rails.application.routes.draw do

  get '/dishes/:id', to: 'dishes#show'
  get '/chefs/:chef_id', to: 'chefs#show'
  get '/chefs/:chef_id/ingredients', to: 'ingredients#index'
end
