class PurchaseScore < ApplicationRecord
  validates :score, :description, :user_id, :shop_id, :purchase_id, presence: true
  validates :purchase_id, uniqueness: true
  validates :score, numericality: { only_integer: true, less_than_or_equal_to: 5 }

  scope :find_scores_by, ->(column, start_date, end_date) { where("#{column} AND created_at >= ? AND created_at <= ? AND deleted='0'", start_date, end_date) }
end
