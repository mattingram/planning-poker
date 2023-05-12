require 'random_name_generator'

class RoomsController < ApplicationController
    before_action :set_room

    def create
        @room = Room.create(name: SecureRandom.uuid)

        if @room
            if !session[:current_user_id].nil?
                # Assign existing user to new room (only 1 room allowed) and clear estimate
                User.where(:id => session[:current_user_id])
                    .update_all({:room_id => @room.id, :estimate => nil})
            end
            redirect_to show_room_path(@room.name)
        else
            render :index, notice: "Error creating room"
        end
    end

    def index
        if @room == nil?
            redirect_to root_path    # TODO: render invalid room error
        end

        if session[:current_user_id].nil?
            # TODO Enhancement: allow user to regen random names with type and length toggles

            #ELVEN, FANTASY, GOBLIN, ROMAN, flip_mode
            # rng = RandomNameGenerator.new(RandomNameGenerator::FANTASY)
            rng = RandomNameGenerator.flip_mode
            @new_name = rng.compose(2)
            session[:current_user_id] = User.create(name: @new_name, room_id: @room.id).id
        end

        @user = User.find(session[:current_user_id])
    end

    def reset
        @room.update_attribute(:estimating, true)
        @room.users.each do |user|
            user.update_attribute(:estimate, nil)
        end
        redirect_to show_room_path(@room.name)
    end

    def show_cards
        @room.update_attribute(:estimating, !@room.estimating)
        redirect_to show_room_path(@room.name)
    end

    def leave
        @user = User.find(session[:current_user_id])
        @user.update_attribute(:room_id, nil)
        @user.update_attribute(:estimate, nil)

        redirect_to root_path
    end

    private

    def set_room
      @room = Room.find_by(name: params[:name])
    end
end
