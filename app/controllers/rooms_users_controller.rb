class RoomsUsersController < ApplicationController

  def new
    @roomsuser = RoomsUser.new(room_id: params[:room_id], user_id: current_user.id)
    @roomsuser.save
    redirect_to room_path(params[:room_id])
  end


end
