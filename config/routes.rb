Rails.application.routes.draw do
  resources :bookshelves do
    resources :books
  end
end
