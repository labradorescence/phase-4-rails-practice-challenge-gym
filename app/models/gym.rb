class Gym < ApplicationRecord
    has_many :membership, dependent: :destroy
    has_many :clients, through: :membership
end