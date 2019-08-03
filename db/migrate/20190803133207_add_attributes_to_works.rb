class AddAttributesToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :investment, :string
    add_column :works, :image_url, :string
  end
end
