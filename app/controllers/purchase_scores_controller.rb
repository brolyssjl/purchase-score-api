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
    @purchase_score = PurchaseScore.find_by(user_id: params[:user_id])
    if !@purchase_score.nil?
      json_response @purchase_score
    else
      render json: "Couldn't find User Score with 'user_id'=#{params[:user_id]}", status: 404
    end
  end

  def show_shop_score
    @purchase_score = PurchaseScore.find_by(shop_id: params[:shop_id])
    if !@purchase_score.nil?
      json_response @purchase_score
    else
      render json: "Couldn't find Shop Score with 'shop_id'=#{params[:shop_id]}", status: 404
    end
  end
end
