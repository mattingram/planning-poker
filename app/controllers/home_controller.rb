class HomeController < ApplicationController
    def index
    end

    def create
        @room = Room.create(name: SecureRandom.uuid)
        if @room
            redirect_to room_name_path(@room.name)
        else
            render :index, notice: "Error creating room"
        end
    end
end
