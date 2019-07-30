class Picture < ApplicationRecord
	resourcify
	mount_uploader :image, ImageUploader
  belongs_to :place
  def self.search(search)
  @place = Place.where('lower(place_name) ILIKE ?', "%#{search.downcase}%")
  	if search == ""
  		@pictures = Picture.all
		elsif @place.nil?
  		@pictures = Picture.where(place_id: 0)
  	else
   		@pictures = Picture.where(place_id: @place.ids)
   	end

  end
end
