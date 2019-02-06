class PurchaseScoresController < ApplicationController

  def show_purchase_score
    @purchase_score = PurchaseScore.find_by(purchase_id: params[:purchase_id])
    json_response @purchase_score
  end

  def show_user_score
  end

  private

  def set_purchase_score
    @purchase_score = PurchaseScore.find(params[:id])
  end
end
