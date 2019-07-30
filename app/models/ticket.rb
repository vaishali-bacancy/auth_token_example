class Ticket < ApplicationRecord
  resourcify
  belongs_to :place
  def self.search(search)
  	@place = Place.where('lower(place_name) ILIKE ?', "%#{search.downcase}%")
  	if search == ""
  		@tickets = Ticket.all
		elsif @place.nil?
  		@tickets = Ticket.where(place_id: 0)		
  	else
   		@tickets = Ticket.where(place_id: @place.ids)
   	end
  end
end
