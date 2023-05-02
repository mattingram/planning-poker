class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update, :destroy]

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
