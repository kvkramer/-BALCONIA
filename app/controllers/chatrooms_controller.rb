class ChatroomsController < ApplicationController
  def index
    @user_chatrooms = policy_scope(Chatroom).where(user: current_user)
    @spheres = Sphere.where(user: current_user)
    @spheres_chats = []
    @spheres.each do |spheres|
      @spheres_chats << Chatroom.where(sphere_id: spheres)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end

  def create
    @sphere = Sphere.find(params[:sphere_id])
    @chatroom = Chatroom.create(name: "chat#{@sphere.id}", sphere_id: @sphere.id, user_id: current_user.id)
    authorize @chatroom
    redirect_to chatroom_path(@chatroom.id)
  end
end
