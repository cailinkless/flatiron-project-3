class Company < ApplicationRecord
    has_many :productions
    has_many :users, through: :productions

    # scope :mine, -> { where(user has company through a production)}
end
