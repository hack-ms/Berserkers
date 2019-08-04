class ChangePromoCodeQuantityType < ActiveRecord::Migration[5.2]
  def change
    remove_column :promo_codes, :quantity, :string
    add_column :promo_codes, :quantity, :integer
  end
end
