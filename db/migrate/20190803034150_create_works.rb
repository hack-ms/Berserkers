class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.decimal :lat, precision: 15, scale: 10
      t.decimal :lng, precision: 15, scale: 10
      t.integer :idn_empreendimento
      t.date    :data_conclusao
      t.date    :data_selecao
      t.string  :estagio
      t.string  :execucao_fisica
      t.string  :obra_nome
      t.references :city
      t.references :work_type
      t.timestamps
    end
  end
end
