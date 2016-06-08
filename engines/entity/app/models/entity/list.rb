module Entity
  class List < ActiveRecord::Base
    has_many :list_cadastres
    
    validates :name, :color, :description, presence: true

    enum color: ['azul','amarelo','verde','vermelho','laranja']

  end
end
