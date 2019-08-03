class AddOtherAttributesToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :executor, :string
    add_column :works, :orgao_responsavel, :string
  end
end
