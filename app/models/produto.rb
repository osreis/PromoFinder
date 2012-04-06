class Produto < ActiveRecord::Base
  attr_accessible :codigo_barras, :nome, :preco_nominal, :preco_promocional
  belongs_to :catalogo, :class_name => "Catalogo",
    :foreign_key => "catalogo_id"
  validates :codigo_barras, :presence => true, :numericality => { :only_integer => true }
  validates :preco_nominal, :presence => true
  validates :preco_promocional, :presence => true
end
