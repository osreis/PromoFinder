class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|
      t.string :marca
      t.integer :edicao
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
