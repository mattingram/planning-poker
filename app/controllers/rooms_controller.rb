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
            else
                join
                return
            end
            redirect_to show_room_path(@room.name)
        else
            render :index, notice: "Error creating room"
        end
    end

    def index
        if @room.nil?
            redirect_to root_path, notice: "Room not found"
        end

        unless session[:current_user_id].nil?
            @user = User.find(session[:current_user_id])
            return
        end

        if params[:user_name].nil?
            @random_username = generate_random_name
        end

        # what if user is logging in from a different device?
        # they have to leave the room on the old device
        # maybe add an option to kick out other players?
    end

    def join
        @user = User.create(name: params[:user_name], room_id: @room.id)
        # add error handling
        session[:current_user_id] = @user.id
        redirect_to show_room_path(@room.name)
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
        session[:current_user_id] = nil

        redirect_to root_path
    end

    private

    def set_room
      @room = Room.find_by(name: params[:name])
    end

    def generate_random_name
        # TODO Enhancement: allow user to regen random names with type and length toggles
        #ELVEN, FANTASY, GOBLIN, ROMAN, flip_mode
        # rng = RandomNameGenerator.new(RandomNameGenerator::FANTASY)
        rng = RandomNameGenerator.flip_mode
        rng.compose(2)
    end
end
