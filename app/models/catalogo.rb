class Catalogo < ActiveRecord::Base
  attr_accessible :data_fim, :data_inicio, :nome, :marca
  has_many :produtos
end
