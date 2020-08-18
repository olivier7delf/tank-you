class AddCapacityToVehicle < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :capacity, :integer
  end
end
