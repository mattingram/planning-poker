class AddEstimateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :estimate, :integer
  end
end
