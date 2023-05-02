class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def show
    end

    private

    def set_room
      @room = Room.find_by(name: params[:name])
    end
end
