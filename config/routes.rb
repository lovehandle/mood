Rails.application.routes.draw do
  namespace :api do
    post "messages/handle", to: 'messages#handle'
  end
end
