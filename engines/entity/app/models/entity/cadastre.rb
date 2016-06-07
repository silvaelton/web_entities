module Entity
  class Cadastre < ActiveRecord::Base

    validates :name, presence: true
  end
end
