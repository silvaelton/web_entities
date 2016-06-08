module Entity
  class ListCadastre < ActiveRecord::Base
    belongs_to :list
    belongs_to :cadastre
  end
end
