class Breed < ApplicationRecord
    belongs_to :user

	validates :shortname, presence: true, uniqueness: true
end
