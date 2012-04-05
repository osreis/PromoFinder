class Produto < ActiveRecord::Base
  attr_accessible :codigo_barras, :nome, :preco_nominal, :preco_promocional
  belongs_to :catalogo
end
