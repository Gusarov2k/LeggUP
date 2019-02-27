Rails.application.routes.draw do
  resources :problems do
    resources :steps, only: %i[create destroy]
  end

  root 'problems#index'
end
