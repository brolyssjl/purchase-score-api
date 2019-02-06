class PurchaseScoresController < ApplicationController
  before_action :set_purchase_score, only: [:show, :update, :delete]

  def show
    json_response @purchase_score
  end

  def create
    @purchase_score = PurchaseScore.create!(purchase_score_params)
    json_response @purchase_score, :created
  end

  def update
    @purchase_score.update(purchase_score_params)
    json_response @purchase_score
  end

  def delete
    @purchase_score.destroy
    head :no_content
  end

  private

  def purchase_score_params
    params.permit(:score, :description, :user_id, :shop_id, :purchase_id)
  end

  def set_purchase_score
    @purchase_score = PurchaseScore.find(params[:id])
  end
end
