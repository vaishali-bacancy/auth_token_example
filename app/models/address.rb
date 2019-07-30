class Address < ApplicationRecord
	resourcify
	belongs_to :state
	belongs_to :place
	#validates :area_name, :road_name, :landmark, :city_name, :remarks, :pincode, presence: true

	#def full_address
		#{}"#{area_name}, #{road_name}, #{landmark}, #{city_name}, #{remarks}, #{pincode}"
	#end
	geocoded_by :address 
	geocoded_by :full_address

	after_validation :geocode
	  def full_address    
	  	"#{area_name}, #{road_name}, #{landmark}, #{city_name}, #{pincode}"
	  end
	
end
