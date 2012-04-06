class Catalogo < ActiveRecord::Base
  attr_accessible :data_fim, :data_inicio, :edicao, :marca
  has_many :produtos
  validates :marca, :presence => true
  validates :edicao, :presence => true
  validates :data_inicio, :presence => true
  validates :data_fim, :presence => true
end
