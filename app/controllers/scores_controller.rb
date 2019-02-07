class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :delete]

  def show
    json_response @score
  end

  def create
    @score = PurchaseScore.create!(score_params)
    json_response @score, :created
  end

  def update
    @score.update(score_params)
    json_response @score
  end

  def delete
    @score.update(deleted: true)
    json_response @score
  end

  private

  def score_params
    params.permit(:score, :description, :user_id, :shop_id, :purchase_id)
  end

  def set_score
    @score = PurchaseScore.find(params[:id])
  end
end
