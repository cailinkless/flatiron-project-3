class Company < ApplicationRecord
    has_many :productions
    has_many :users, through: :productions

    validates :name, presence: true
end
