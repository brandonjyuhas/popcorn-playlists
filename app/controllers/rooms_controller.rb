class RoomsController < ApplicationController

  def index
    @room = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @roomUser = RoomsUser.new(room_id: @room.id, user_id: current_user.id)
      @roomUser.save
      redirect_to("/")
    else
      render :json => { :errors => @room.errors.full_messages }
    end

  end

  private
    def room_params
      params.require(:room).permit(:name)
    end

end
