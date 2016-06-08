module Admin
  class User < ActiveRecord::Base
    attr_accessor :password_confirmation

    enum situation:   ['ativo', 'inativo']
    enum permission:  ['master', 'editor', 'visualizador']

    validates :first_name, :last_name, :situation, :permission, presence: true
    validates :email, email: true, uniqueness: true, presence: true

    validates :password_digest, :password_confirmation, presence: true, if: :password_change?
    validates :password_digest, :password_confirmation, length: { maximum: 12, minimum: 6 }, if: :password_change?

    validate  :password_compare, if: :password_change?

    def name
      "#{first_name.humanize} #{last_name.humanize}"
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
