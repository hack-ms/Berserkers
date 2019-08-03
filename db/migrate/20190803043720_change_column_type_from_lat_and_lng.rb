class ChangeColumnTypeFromLatAndLng < ActiveRecord::Migration[5.2]
  def change
    change_column :works, :lat, :string
    change_column :works, :lng, :string
  end
end
