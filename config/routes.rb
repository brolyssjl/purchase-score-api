Rails.application.routes.draw do
  get 'purchasescores/:purchase_id', action: :show, controller: 'purchase_scores'
end
