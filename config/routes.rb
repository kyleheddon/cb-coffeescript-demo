CbcsDemo::Application.routes.draw do
  root 'application#index'
  resources :jobs
end
