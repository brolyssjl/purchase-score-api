require 'rails_helper'

RSpec.describe PurchaseScore, type: :model do
  # Validation tests
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:shop_id) }
  it { should validate_presence_of(:purchase_id) }
  # Validate uniqueness of purchase_id
  it { should validate_uniqueness_of(:purchase_id) }
  it { should validate_numericality_of(:score).only_integer }
  it { should validate_numericality_of(:score).is_less_than_or_equal_to(5) }
end
