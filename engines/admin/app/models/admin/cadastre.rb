module Admin
  class Cadastre < Entity::Cadastre
    
    scope :by_acronym,  -> (acron) {where("acronym ILIKE '%#{acron}%'")}
    scope :by_cnpj,     -> (cnpj)  {where(cnpj: cnpj)}

    validates :name, :acronym, :telephone, presence: true
    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :email, email: true, presence: true
    validates :email_optional, email: true, allow_blank: true

    validates :state, :city, :cep, :address, :burgh, presence: true

    attr_accessor :password_confirmation

    validates :password_digest, :password_confirmation, presence: true
    validates :password_digest, :password_confirmation, length: { maximum: 12, minimum: 6 }

    validate  :password_compare

   
    private

    def password_compare
      unless self.password_digest == self.password_confirmation
        errors.add(:password_digest, "Senhas não são iguais")
      end
    end
  end
end
