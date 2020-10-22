class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
  
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
