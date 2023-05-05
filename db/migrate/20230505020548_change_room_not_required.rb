class ChangeRoomNotRequired < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :room_id, true
  end
end
