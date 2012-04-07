class Catalogo < ActiveRecord::Base
  attr_accessible :data_fim, :data_inicio, :nome, :marca
  has_many :produtos
  validates :marca, :presence => { :message => "do catálogo precisa ser informada."}
  validates :nome, :presence => { :message => "do catálogo precisa ser informado."}
  validates :data_inicio, :presence => { :message => "do catálogo precisa ser informada."}
  validates :data_fim, :presence => { :message => "do catálogo precisa ser informada."}
end
