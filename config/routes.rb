Rails.application.routes.draw do
  
  root :to => "programs#index"
  get 'funders/mypage', :to => 'funders#mypage'
  get 'funders/mypage/edit', :to => 'funders#edit'
  put 'funders/mypage', :to => 'funders#update'
  get 'funders/mypage/edit_password', :to => 'funders#edit_password'
  put 'funders/mypage/password', :to => 'funders#update_password'
  get 'funders/mypage/programs', :to => 'programs#funders_program_index'

  get 'users/mypage', :to => 'users#mypage'
  get 'users/mypage/edit', :to => 'users#edit'
  put 'users/mypage', :to => 'users#update'
  get 'users/mypage/edit_password', :to => 'users#edit_password'
  put 'users/mypage/password', :to => 'users#update_password'
  delete 'users/destroy', :to => 'users#destroy'
  get 'users/mypage/history' => 'users#view_history'
  get 'users/mypage/interest' => 'users#interest'
  resources :search_parameter_saves, only: [:index, :new, :create, :destroy]
  resources :programs do
    resource :interests, only: [:create, :destroy]
    collection do
      get "search" => 'programs#search_result'
    end
  end
  
  devise_for :funders, controllers: {
    confirmations: 'funders/confirmations',
    passwords: 'funders/passwords',
    registrations: 'funders/registrations',
    sessions: 'funders/sessions',
    unlocks: 'funders/unlocks',
  }

  devise_scope :funder do
    get "funders/verify", :to => "funders/registrations#verify"
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
  }

  devise_scope :user do
    get 'verify', :to => 'users/registrations#verify'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
