class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.decimal :lat, precision: 15, scale: 10
      t.decimal :lng, precision: 15, scale: 10
      t.string  :photo      
      t.text    :description

      t.references :user, index: true
      t.references :work, index: true
      t.timestamps
    end
  end
end
