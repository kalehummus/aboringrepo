Rails.application.routes.draw do
  get 'books/searchbook'
  get 'greetings/hello'
  root 'books#searchbook'
  post '/books/searchbook'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
