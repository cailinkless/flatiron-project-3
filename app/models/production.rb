class Production < ApplicationRecord
    belongs_to :user
    belongs_to :company
    # custom setter for companies attributes
    accepts_nested_attributes_for :company, reject_if: :all_blank

    scope :published, -> { where("published = true")}
    #scope :upcoming, -> { where("opening > CURRENT DATETIME?")}
    #scope :current, -> { where("opening < CURRENT DATETIME?")}
    #scope :past, -> { where("closing < CURRENT DATETIME?")}
end
