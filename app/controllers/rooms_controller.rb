class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def create
        @room = Room.create(name: SecureRandom.uuid)
        session[:current_user_id] = User.create(name: SecureRandom.alphanumeric, room_id: @room.id).id
        if @room
            redirect_to show_room_path(@room.name)
        else
            render :index, notice: "Error creating room"
        end
    end

    def show
        if @room == nil
            redirect_to root_path
        end
    end

    def reset
        @room.update_attribute(:estimating, true)
        @room.users.each do |user|
            user.update_attribute(:estimate, nil)
        end
    end

    def show_cards
        @room.update_attribute(:estimating, false)
    end

    private

    def set_room
      @room = Room.find_by(name: params[:name])
    end
end
