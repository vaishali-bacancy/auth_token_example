class Timing < ApplicationRecord
  resourcify
  belongs_to :place
  def self.search(search)
  	@place = Place.where('lower(place_name) ILIKE ?', "%#{search.downcase}%")
  	if search == ""
  		@timings = Timing.all
		elsif @place.nil?
  		@timings = Timing.where(place_id: 0)		
  	else
   		@timings = Timing.where(place_id: @place.ids)
   	end
  end
end
