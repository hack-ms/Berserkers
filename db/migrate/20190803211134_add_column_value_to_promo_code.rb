class AddColumnValueToPromoCode < ActiveRecord::Migration[5.2]
  def change
    add_column :promo_codes, :formatted_value, :string
    add_column :promo_codes, :company_logo, :string
    add_column :promo_codes, :description, :text
  end
end
