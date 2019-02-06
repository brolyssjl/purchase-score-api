Rails.application.routes.draw do
  get 'purchasescores/:id', action: :show, controller: 'purchase_scores'
  post 'purchasescores', action: :create, controller: 'purchase_scores'
  put 'purchasescores/:id', action: :update, controller: 'purchase_scores'
  delete 'purchasescores/:id', action: :delete, controller: 'purchase_scores'
end
