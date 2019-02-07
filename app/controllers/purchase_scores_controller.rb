class PurchaseScoresController < ApplicationController
  def show_purchase_score
    @purchase_score = PurchaseScore.find_by(purchase_id: params[:purchase_id])
    if !@purchase_score.nil?
      json_response @purchase_score
    else
      render json: "Couldn't find Purchase Score with 'purchase_id'=#{params[:purchase_id]}", status: 404
    end
  end

  def show_user_score
    search_scores_by "user_id = #{params[:user_id]}", 'User'
  end

  def show_shop_score
    search_scores_by "shop_id = #{params[:shop_id]}", 'Shop'
  end

  private

  def search_scores_by(conditions, msg)
    @purchase_score = PurchaseScore.find_scores_by(conditions, params[:start], params[:end])
    if !@purchase_score.empty?
      json_response @purchase_score
    else
      render json: "Couldn't find #{msg} Scores", status: 404
    end
  end
end
