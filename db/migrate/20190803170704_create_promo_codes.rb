class CreatePromoCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :promo_codes do |t|
      t.string :company_name
      t.string :code
      t.string :quantity, default: 0
      t.string :description
      
      t.timestamps
    end
  end
end
