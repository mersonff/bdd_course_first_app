class Routine < ApplicationRecord
  validates_presence_of :name, message: 'Nome não pode estar em branco'
  validates_presence_of :description, message: 'Descrição não pode estar em branco'
end
