class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :codigo_barras
      t.string :nome
      t.decimal :preco_nominal
      t.decimal :preco_promocional

      t.timestamps
    end
  end
end
