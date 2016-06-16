module Entity
  class Cadastre < ActiveRecord::Base
    belongs_to :state, class_name: "State"

    has_many :members
    has_many :directories
    
    scope :by_cnpj, -> (cnpj) {where(cnpj: cnpj)}    
    scope :by_acronym, -> (acronym) {where("acronym ILIKE '%#{acronym}%'")}    
    enum color: ['azul','amarelo','verde','vermelho','laranja']
    
    validates :name, :acronym, :telephone, presence: true
    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :email, email: true, presence: true
    validates :email_optional, email: true, allow_blank: true

    validates :state, :city, :cep, :address, :burgh, presence: true

    attr_accessor :password_confirmation

    validates :password_digest, :password_confirmation, presence: true, if: :password_change?
    validates :password_digest, :password_confirmation, length: { maximum: 12, minimum: 6 }, if: :password_change?

    validate  :password_compare, if: :password_change?

    def president
      self.directories.where(job: 0).first
    end
   
    private

    def password_compare
      unless self.password_digest == self.password_confirmation
        errors.add(:password_digest, "Senhas não são iguais")
      end
    end

    def password_change?
      self.password_digest_changed?
    end

  end
end
