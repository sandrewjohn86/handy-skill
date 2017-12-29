Rails.application.routes.draw do
  resources :projects, only: [:new, :create]

  devise_for :clients, controllers: {
    #confirmations: 'clients/confirmations',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations',
    sessions: 'client/sessions',
    # unlocks: 'client/unlocks',
  }, skip: [:sessions]

  ## custom routes for clients
  as :client do
    get 'clients/login' => 'clients/sessions#new', as: :new_client_session
    post 'clients/login' => 'clients/sessions#create', as: :client_session
    delete 'clients/logout' => 'clients/sessions#destroy', as: :destroy_client_session
    get 'clients/signup' => 'clients/registrations#new'
  end

  root to: 'home#index'
end
