module Entity
  class Cadastre < ActiveRecord::Base
    belongs_to :state, class_name: "State"

    enum color: ['azul','amarelo','verde','vermelho','laranja']
  end
end
