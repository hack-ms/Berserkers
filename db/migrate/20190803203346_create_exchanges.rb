class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.references :user, index: true
      t.references :promo_code, index: true
      t.timestamps
    end
  end
end
