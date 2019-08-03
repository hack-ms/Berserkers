class AddColumnValueToPromoCode < ActiveRecord::Migration[5.2]
  def change
    add_column :promo_codes, :formatted_value, :string
    add_column :promo_codes, :company_logo, :string
  end
end
