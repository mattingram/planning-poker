class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def create
        @room = Room.create(name: SecureRandom.uuid)
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

    private

    def set_room
      @room = Room.find_by(name: params[:name])
    end
end
