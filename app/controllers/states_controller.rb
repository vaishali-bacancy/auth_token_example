  class StatesController < ApplicationController
  # load_and_authorize_resource
  # before_action :authenticate_user!, except: [:index, :show]
  layout 'adminlayout'
  #load_and_authorize_resource
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]
  def new
    @state = State.new
  end

  def index 
    render json: State.all
  end

  def show 
    render json: State.find(params[:id])
  end 

  # def show
  # end

  # def index
  #   @states = State.all
  # end

  def create
    @state = State.new(state_params)
    #.@state.user = current_user
    if @state.save
        redirect_to @state, notice: 'State was successfully created.'
      else
        render 'new'
     end 
  end

  def edit  
  end

  def update
    if @state.update_attributes(state_params)
      redirect_to @state, notice: 'State was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @state.destroy
    redirect_to states_path, notice: 'State was successfully destroyed.'
  end

  private
  def set_state
    @state = State.find(params[:id])
  end
  def state_params
      params.require(:state).permit(:state_name)
  end
end
