module Entity
  class Member < ActiveRecord::Base
    belongs_to :state, class_name: 'State'
    belongs_to :work_state, class_name: 'State'
    belongs_to :born_state, class_name: 'State'
    belongs_to :cadastre

    scope :by_cpf, -> (value) { where(cpf: value)}
    scope :by_name, -> (value) { where("name ILIKE '%#{value}%'")}
    scope :by_situation, -> (value) { where(situation: value)}
    
    enum situation: ['regular','irregular','desligado']
    enum gender:  ['masculino', 'feminino']
    enum civil_state: ['solteiro', 'casado', 'viúvo']


    validates :name, :rg, :born, :born_state, :born_city, :state,
              :city, :cep, :address, :work_state,
              :work_city, :work_cep, :work_address, :situation, presence: true
    validates :email, email: true, presence: true
    validates :email_optional, email: true, allow_blank: true
    validates :telephone, :work_telephone, numericality: true, presence: true
    validates :celphone, :work_telephone_optional, numericality: true, allow_blank: true

    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, scope: :cadastre
  end
end
