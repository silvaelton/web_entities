module Entity
  class Member < ActiveRecord::Base
    belongs_to :state, class_name: 'State'
    belongs_to :work_state, class_name: 'State'
    belongs_to :born_state, class_name: 'State'
    belongs_to :cadastre

    scope :by_cpf, -> (value) { where(cpf: value)}
    scope :by_name, -> (value) { where("name ILIKE '%#{value}%'")}
    scope :by_situation, -> (value) { where(situation: value)}

    scope :allows, -> { where(situation: 0)}
    
    enum situation: ['regular_e_publicado','irregular','desligado', 'regular']
    enum gender:  ['masculino', 'feminino']
    enum civil_state: ['solteiro', 'casado', 'viúvo', 'divorciado', 'separado', 'união_estável']

    validates :name, :rg, :born, :born_state, :born_city, :state,
              :city, :cep, :address, :work_state,
              :work_city, :work_cep, :work_address, :situation, presence: true
    validates :email, email: true, presence: true
    validates :email_optional, email: true, allow_blank: true
    validates :telephone, :work_telephone, numericality: true, presence: true
    validates :celphone, :work_telephone_optional, numericality: true, allow_blank: true

    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, scope: :cadastre

    validates :spouse_name, :spouse_rg, :spouse_cpf, presence: true, if: :marriege?
    validates :spouse_cpf, cpf: true, if: :marriege?
    validate  :spouse_unique_cpf, if: :marriege?


    def self.preview_number
      max = (self.all.present?) ? self.all.maximum(:id) : 0
      max + 1
    end

    private

    def marriege?
      self.casado?
    end

    def spouse_unique_cpf
      if self.cpf == self.spouse_cpf
        errors.add(:spouse_cpf, "O cpf do conjugê não pode ser igual ao cpf do membro")
      end
    end
  end
end
