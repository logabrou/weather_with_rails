Rails.application.routes.draw do
  resources :daily_weathers
  # get 'home/index'
  root 'home#index'
  get 'home/show'
  get 'highcharts/data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
