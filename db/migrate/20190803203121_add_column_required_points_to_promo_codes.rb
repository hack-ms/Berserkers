class AddColumnRequiredPointsToPromoCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :promo_codes, :required_points, :integer, default: 1
  end
end
