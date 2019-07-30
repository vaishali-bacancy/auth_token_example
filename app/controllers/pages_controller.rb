class PagesController < ApplicationController
	layout 'adminlayout'
	authorize_resource :class => false
	before_action :authenticate_user!
	
	def new
	end
end
