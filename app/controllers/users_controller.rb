class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def estimate
        @user.update_attribute(:estimate, params[:estimate])
        redirect_to show_room_path(@user.room.name)
    end

    private

    def set_user
      @user = User.find(session[:current_user_id])
    end
end
