Rails.application.routes.draw do
  root 'books#index'
  get 'readers/index'
  get 'authors/index'
  get 'books', to: 'books#index'
  get 'subjects', to: 'subjects#index'
  get 'authors', to: 'authors#index'
  get 'about', to: 'about#index'
  get 'subjects/:id/books', to: 'subjects#books', as: 'subject_books'


  resources :books, only: [:index, :show]
  resources :subjects do
    member do
      get 'books'  # Add this line to define the 'books' action as a member route
    end
  end
  resources :authors, only: [:index, :show]

end
