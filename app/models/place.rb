class Place < ApplicationRecord
	resourcify
	ratyrate_rateable "place_name"
  has_one :address, dependent: :destroy
  has_one :ticket,  dependent: :destroy
  has_many :timings, dependent: :destroy
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :address
  validates :place_name, :place_type, :place_details, :phone_number, presence: true
  enum status:[:pending,:confirmed]

end
