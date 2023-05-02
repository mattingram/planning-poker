require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
    test "Creates new room" do
        visit root_path
        assert_selector "button", text: "Create new room"

        click_on "Create new room"
        assert_selector "h1", text: "Room"
    end
end