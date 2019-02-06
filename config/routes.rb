Rails.application.routes.draw do
  get 'scores/:id', action: :show, controller: 'scores'
  post 'scores', action: :create, controller: 'scores'
  put 'scores/:id', action: :update, controller: 'scores'
  delete 'scores/:id', action: :delete, controller: 'scores'
end
