class Production < ApplicationRecord
    belongs_to :user
    belongs_to :company
    # custom setter for companies attributes
    accepts_nested_attributes_for :company, reject_if: :all_blank
    
    validates :company, presence: true
    validates :title, presence: true

    include ActiveModel::Validations
    validates_with ClosingValidator

    scope :unpublished, -> { where("published = false") }
    scope :published, -> { where("published = true") }
    scope :upcoming, -> { published.where("opening > ?", Time.now) }
    scope :past, -> { published.where("closing < ?", Time.now) }
    scope :started, -> { published.where("opening < ?", Time.now) }
    scope :current, -> { started.where("closing > ?", Time.now) }

    def company_attributes=(company_attributes)
            @company = Company.find_or_create_by(company_attributes)
            unless @company.name == ""
              self.company = @company 
            end
    end

    def readable_opening
      @readable_opening = self.opening.strftime("%B %e, %Y %l:%M %p")
    end

    def readable_closing
      @readable_closing = self.closing.strftime("%B %e, %Y %l:%M %p")
    end

end
