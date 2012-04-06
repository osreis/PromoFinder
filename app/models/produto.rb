class Produto < ActiveRecord::Base
  attr_accessible :codigo_barras, :nome, :preco_nominal, :preco_promocional
  belongs_to :catalogo, :class_name => "Catalogo",
    :foreign_key => "catalogo_id"
  validates :codigo_barras, :presence => { :message => "precisa estar preenchido." }, :numericality => { :only_integer => true, :message => "inválido. Só aceita números."} 
  validates :preco_nominal, :presence => { :message => "precisa estar preenchido." }
  validates :preco_promocional, :presence => { :message => "precisa estar preenchido." }
end
