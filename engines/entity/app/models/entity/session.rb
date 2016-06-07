module Entity
  class Session
    include ActiveModel::Model
    
    attr_accessor :cnpj, :password, :id

    validates :cnpj, cnpj: true, presence: true
    validates :password, presence: true

    validate  :verificate!

    private

    def verificate!
      user = Entity::Cadastre.where(cnpj: self.cnpj, password_digest: self.password).last

      if user.present?
        self.id = user.id
      else
        errors.add(:cnpj, 'CNPJ ou Senha está incorreta. Favor verificar.') 
      end
    end
  end
end