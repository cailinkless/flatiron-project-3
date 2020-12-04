class Production < ApplicationRecord
    belongs_to :user
    belongs_to :company
    # custom setter for companies attributes
    accepts_nested_attributes_for :companies, reject_if: :all_blank
end
