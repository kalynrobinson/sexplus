class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @pairs = UserPair.where('user1_id = ? OR user2_id = ?', @user.id, @user.id)
  end
end
