Rails.application.routes.draw do
 


 get 'admin', :to => 'access#index'

  #get 'demo/index'


  root "public#index"

  # use :attr_name to use any parameter
  # :permalink made available to the controller
  get 'show/:permalink', :to=>'public#show'
  match ':controller(/:action(/:id))', :via => [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
