class Company < ApplicationRecord
    has_many :productions
    has_many :users, through: :productions
end
