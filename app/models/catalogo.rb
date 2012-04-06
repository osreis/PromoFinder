class Catalogo < ActiveRecord::Base
  attr_accessible :data_fim, :data_inicio, :nome, :marca
  has_many :produtos
  validates :marca, :presence => true
  validates :nome, :presence => true
  validates :data_inicio, :presence => true
  validates :data_fim, :presence => true
end
