class State < ApplicationRecord
	resourcify
	has_many :addresses, dependent: :destroy
	validates :state_name, presence: true, uniqueness: true
end
