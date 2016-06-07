module Admin
  class Session
    include ActiveModel::Model
    
    attr_accessor :email, :password, :id

    validates :email, email: true, presence: true
    validates :password, presence: true

    validate  :verificate!

    private

    def verificate!
      user = Admin::User.where(email: self.email, password_digest: self.password).last

      if user.present?
        self.id = user.id
      else
        errors.add(:email, 'E-mail ou Senha está incorreta. Favor verificar.') 
      end
    end
  end
end