class UsersController < ApplicationController

  before_action :set_user, only: [:show, :follow, :unfollow]

  # def index
  #   @users = User.where.not(id: current_user.id)
  # end

  def show
    authorize @user
    @chatrooms = Chatroom.joins(:sphere).where(user: current_user, spheres: {user: @user})
    @messages = Message.where(chatroom: @chatrooms)
  end

  def follow
    authorize @user
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    authorize @user
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
