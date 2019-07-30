class StaticPagesController < ApplicationController
  layout 'staticpagelayout'
  def new
    if user_signed_in?
      if current_user.has_role? :admin
        # redirect_to new_page_path
			end
    end
  end
  
  def search
    @search= params[:search_area]
      @addresses = Address.where("lower(area_name) ILIKE ?", "%#{@search}%" )
      @places=Array.new
      @addresses.each do |address|
        @places<<address.place
      end
    
  end

  def ticket
  	@place_id=params[:id]
  	@place=Place.find(@place_id)
  	@tickets  = Ticket.where(place_id: @place_id).order("ticket_type ASC")		
  end

  def address
  	@place_id=params[:id]
  	@place=Place.find(@place_id)
  	@addresses  = Address.where(place_id: @place_id)
  end

  def timing
  	@place_id=params[:id]
  	@place=Place.find(@place_id)
  	@timings  = Timing.where(place_id: @place_id)
  end

  def details
  	@place_id=params[:id]
  	@place=Place.find(@place_id)	
  end

  def photos
    @place_id=params[:id]
    @place=Place.find(@place_id)
    @pictures  = Picture.where(place_id: @place_id)
  end

  def index
  	search=params[:search]
  	@places = Place.where('lower(place_name) ILIKE ?', "%#{search}%")
 	end

  def rating
    @place = Place.find(params[:id])
  end

  private
    def place_params
      params.require(:place).permit(:place_name, :place_type, :place_details, :phone_number, :search_area)
    end
end
