require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
    test "Shows room" do
        visit room_name_path(name:"456b3b28-53ba-4582-bb01-ad5822b00303")
        assert_selector "h1", text: "Room"
        assert_selector "a", { text: "Leave room" }
    end

    test "Invalid room" do
        visit room_name_path(name:"abcUUID")
        assert_selector "h1", text: "Planning Poker"
    end
end