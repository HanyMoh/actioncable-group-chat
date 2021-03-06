class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    redirect_to @chatroom
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
