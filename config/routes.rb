Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "labels", to: "labels#index", as: 'labels_index'
  root "labels#index"
end
