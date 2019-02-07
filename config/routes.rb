Rails.application.routes.draw do
  get 'scores/:id', action: :show, controller: 'scores'
  post 'scores', action: :create, controller: 'scores'
  put 'scores/:id', action: :update, controller: 'scores'
  delete 'scores/:id', action: :delete, controller: 'scores'

  get 'scores/purchases/:purchase_id', action: :show_purchase_score, controller: 'purchase_scores'
  get 'scores/users/:user_id', action: :show_user_score, controller: 'purchase_scores'
  get 'scores/shops/:shop_id', action: :show_shop_score, controller: 'purchase_scores'
end
