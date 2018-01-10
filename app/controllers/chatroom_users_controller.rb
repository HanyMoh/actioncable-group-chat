class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  # # GET /chatrooms
  # # GET /chatrooms.json
  # def index
  #   @chatrooms = Chatroom.all
  # end
  #
  # # GET /chatrooms/1
  # # GET /chatrooms/1.json
  # def show
  # end
  #
  # # GET /chatrooms/new
  # def new
  #   @chatroom = Chatroom.new
  # end
  #
  # # GET /chatrooms/1/edit
  # def edit
  # end
  #
  # # POST /chatrooms
  # # POST /chatrooms.json
  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    redirect_to @chatroom
  end
  #
  # # PATCH/PUT /chatrooms/1
  # # PATCH/PUT /chatrooms/1.json
  # def update
  #   respond_to do |format|
  #     if @chatroom.update(chatroom_params)
  #       format.html { redirect_to @chatroom, notice: 'Chatroom was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @chatroom }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @chatroom.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /chatrooms/1
  # # DELETE /chatrooms/1.json
  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end
  #
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def chatroom_params
  #     params.require(:chatroom).permit(:name)
  #   end
end
