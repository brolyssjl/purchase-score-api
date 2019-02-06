class PurchaseScoresController < ApplicationController
  before_action :set_purchase_score

  def show
    json_response(@purchase_score)
  end

  private

  def set_purchase_score
    @purchase_score = PurchaseScore.find(params[:purchase_id])
  end
end
